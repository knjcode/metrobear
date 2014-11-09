class User < ActiveRecord::Base
  has_many :visitings, dependent: :destroy
  has_many :stations, through: :visitings
  serialize :trophies

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]

    if provider == "github"
      image_url = auth_hash[:extra][:raw_info][:avatar_url]
    else
      image_url = auth_hash[:info][:image]
    end

    if provider == "facebook" || provider == "google_oauth2"
      nickname = auth_hash[:info][:name]
    else
      nickname = auth_hash[:info][:nickname]
    end

    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.image_url = image_url
      user.visiting_count = 0
      user.trophy_count = 0
    end
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def update_image(auth_hash)
    provider = auth_hash[:provider]

    if provider == "github"
      update_attribute(:image_url, auth_hash[:extra][:raw_info][:avatar_url])
    else
      update_attribute(:image_url, auth_hash[:info][:image])
    end
  end

  def visiting?(station_id)
    visitings.find_by_station_id(station_id)
  end

  def visit!(station_id)
    visitings.create!(station_id: station_id)
    # 駅を訪問した際にトロフィーを更新
    set_trophy
    update_count
  end

  def unvisit!(station_id)
    visitings.find_by_station_id(station_id).destroy
    # 訪問駅が減ったのでトロフィーを更新
    set_trophy
    update_count
  end

  def update_count
    update_attribute(:visiting_count, visitings.count)
  end

  def get_trophy
    # 取得済みトロフィーを配列で返す
    trophies
  end

  def set_trophy
    # array of visited station_id
    visited_stations = visitings.pluck(:station_id)

    # backup trophies
    if trophies.nil?
      old_trophies = []
    else
      old_trophies = trophies
    end

    new_trophies = []
    flash_message = ""

    # foreach trophy
    METRO_TROPHY.each do |trophy|
      trophy_name   = trophy[0]
      trophy_count  = trophy[1]["counts"]
      station_array = trophy[1]["stations"]

      if visiting_count >= trophy_count
        station_id_array = []
        if station_array
          station_array.each do |station|
            station_id_array << METRO_STATION.keys.find_index(station)+1
          end
        end

        if (station_id_array - visited_stations).empty?
          new_trophies << trophy_name
        end
      end
    end

    update_attribute(:trophies, new_trophies)
    update_attribute(:trophy_count, new_trophies.count)

    if (new_trophies - old_trophies).present?
      (new_trophies - old_trophies).each do |trophy|
        flash_message << METRO_TROPHY[trophy]["nickname"] << " "
      end
    end

    if flash_message.present?
      flash_message << "のトロフィーを獲得しました！"
    end

    return flash_message
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
