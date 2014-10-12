class Station < ActiveRecord::Base
  has_many :visitings
  has_many :users, through: :visitings
end
