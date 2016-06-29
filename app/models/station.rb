class Station < ActiveRecord::Base
  scope :ordered, -> { joins(:routes_stations).order("routes_stations.position").uniq }

  has_many :trains
  has_many :routes_stations
  has_many :routes, through: :routes_stations

  validates :title, presence: true
 
  def update_position(route, position)
    route_station = route_station(route)
    route_station.update(position: position) if route_station
  end
 
  def position_in(route)
    route_station(route).try(:position)
  end
 
  protected
 
  def route_station(route)
    @route_station ||= routes_stations.where(route: route).first
  end
end
