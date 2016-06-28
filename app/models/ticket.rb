class Ticket < ActiveRecord::Base
  belongs_to :train
  belongs_to :user
  belongs_to :departure_station, class_name: 'Station', foreign_key: :departure_station_id
  belongs_to :destination_station, class_name: 'Station', foreign_key: :destination_station_id

  validates :passenger_name, presence: true
end
