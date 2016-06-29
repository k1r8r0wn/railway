class SleepingCarriage < Carriage
  validates :lower_berths, presence: true
  validates :upper_berths, :side_lower_berths, :side_upper_berths, :sitting_berths, absence: true

  def self.model_name
    Carriage.model_name
  end
end
