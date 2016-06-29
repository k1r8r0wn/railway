class RoutesStation < ActiveRecord::Base
  belongs_to :station
  belongs_to :route

  validates :station_id, uniqueness: { scope: :route_id }
end
