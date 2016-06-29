class Route < ActiveRecord::Base
  has_many :routes_stations
  has_many :stations, through: :routes_stations
  has_many :trains

  validates :name, presence: true
  validate  :stations_count

  before_validation :set_name

  private

  def set_name
    self.name ||= "#{stations.first.title}-#{stations.last.title}"
  end

  def stations_count
    if stations.size < 2
      errors.add(:base, 'Route should contain at least 2 stations.')
    end
  end
end
