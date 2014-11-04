class User < ActiveRecord::Base
  has_many :visitings, dependent: :destroy
  has_many :stations, through: :visitings
  serialize :trophies
  #before_save { self.email = email.downcase }
  #before_create :create_remember_token
  #validates :name,  presence: true, length: { maximum: 50 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
  #                  uniqueness: { case_sensitive: false }
  #has_secure_password
  #validates :password, length: { minimum: 6 }

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]

    if provider == "github"
      image_url = auth_hash[:extra][:raw_info][:avatar_url]
    else
      image_url = auth_hash[:info][:image]
    end

    if provider == "facebook"
      nickname = auth_hash[:info][:name]
    else
      nickname = auth_hash[:info][:nickname]
    end

    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.image_url = image_url
      user.set_trophy
    end
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def visiting?(station_id)
    visitings.find_by_station_id(station_id)
  end

  def visit!(station_id)
    visitings.create!(station_id: station_id)
    # 駅を訪問した際にトロフィーを更新
    set_trophy
  end

  def unvisit!(station_id)
    visitings.find_by_station_id(station_id).destroy
    # 訪問駅が減ったのでトロフィーを更新
    set_trophy
  end

  def station_count
    visitings.count
  end

  def trophy_count
    trophies.count
  end

  def get_trophy
    # 取得済みトロフィーを配列で返す
    trophies
  end

  def set_trophy
    # array of visited station_id
    visited_stations = visitings.pluck(:station_id)
    # reset trophies
    trophies = []

    # foreach trophy
    METRO_TROPHY.each do |trophy|
      trophy_name   = trophy[0]
      trophy_count  = trophy[1]["counts"]
      station_array = trophy[1]["stations"]

      if station_count >= trophy_count
        station_id_array = []
        if station_array
          station_array.each do |station|
            station_id_array << Station.find_by_name(station).id
          end
        end

        if (station_id_array - visited_stations).empty?
          trophies << trophy_name
        end
      end
    end

    update_attribute(:trophies, trophies)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
