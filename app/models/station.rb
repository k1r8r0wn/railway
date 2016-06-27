class Station < ActiveRecord::Base
  has_many :trains
  has_many :routes_stations
  has_many :routes, through: :routes_stations

  validates :title, presence: true
end
