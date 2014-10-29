class User < ActiveRecord::Base
  has_many :visitings
  has_many :stations, through: :visitings
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
    image_url = auth_hash[:info][:image]

    if provider == "facebook"
      nickname = auth_hash[:info][:name]
    else
      nickname = auth_hash[:info][:nickname]
    end

    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.image_url = image_url
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
  end

  def unvisit!(station_id)
    visitings.find_by_station_id(station_id).destroy
  end

  def station_count
    visitings.count
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
