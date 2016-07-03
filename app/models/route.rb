class Route < ActiveRecord::Base
  has_many :waypoints, dependent: :destroy
  has_many :stations, through: :waypoints
  has_many :trains

  validates :name, presence: true
  validate  :stations_count

  before_validation :set_name

  private

  def set_name
    if stations.present?
      self.name ||= "#{stations.first.title}-#{stations.last.title}"
    else
      errors.add(:base, 'Route should not be empty.')
    end
  end

  def stations_count
    if stations.size < 2
      errors.add(:base, 'Route should contain at least 2 stations.')
    end
  end
end
