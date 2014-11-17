class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :station

  default_scope { order('created_at DESC') }

  validates :user_id,    presence: true
  validates :station_id, presence: true
  validates :nickname,   presence: true
  validates :content,    presence: true
  validates :content,    length: { maximum: 400 }
end
