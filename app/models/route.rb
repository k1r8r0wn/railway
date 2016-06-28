class Route < ActiveRecord::Base
  has_many :routes_stations
  has_many :stations, through: :routes_stations
  has_many :trains

  validates :title, presence: true
end
