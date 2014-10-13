class Visiting < ActiveRecord::Base
  belongs_to :user
  belongs_to :station

  validates :user_id,    presence: true
  validates :station_id, presence: true
end
