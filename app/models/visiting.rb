class Visiting < ActiveRecord::Base
  belongs_to :user
  belongs_to :station
end
