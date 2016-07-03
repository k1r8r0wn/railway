class Station < ActiveRecord::Base
  has_many :trains
  has_many :waypoints, dependent: :destroy
  has_many :routes, through: :waypoints

  validates :title, presence: true
end
