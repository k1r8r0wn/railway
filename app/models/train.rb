class Train < ActiveRecord::Base
  default_scope { order (:number) }

  belongs_to :current_station, class_name:  'Station',
                               foreign_key: :current_station_id
  belongs_to :route
  has_many   :tickets
  has_many   :carriages

  validates :number, presence: true

  # def train_details
  #   self.carriages.group(:carriage_type).count
  # end

  # def sleeping_berths
  #   self.carriages.where(carriage_type: 'sleeping').inject(Hash.new(0)) do |hash, carriage|
  #     hash[:lower_berths] += carriage.lower_berths
  #     hash[:upper_berths] += carriage.upper_berths
  #     hash
  #   end
  # end

  # def coupe_berths
  #   self.carriages.where(carriage_type: 'coupe').inject(Hash.new(0)) do |hash, carriage|
  #     hash[:lower_berths] += carriage.lower_berths
  #     hash[:upper_berths] += carriage.upper_berths
  #     hash
  #   end
  # end
end
