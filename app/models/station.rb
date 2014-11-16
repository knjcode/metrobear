class Station < ActiveRecord::Base
  has_many :visitings, dependent: :destroy
  has_many :users, through: :visitings
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  validates :name, presence: true
end
