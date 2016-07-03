class Waypoint < ActiveRecord::Base
  scope :ordered, -> { order('waypoints.position') }

  belongs_to :station
  belongs_to :route

  validates :station_id, uniqueness: { scope: :route_id }
end
