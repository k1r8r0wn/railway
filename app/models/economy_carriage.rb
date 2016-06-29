class EconomyCarriage < Carriage
  validates :upper_berths, :lower_berths, :side_lower_berths, :side_upper_berths, presence: true
  validates :sitting_berths, absence: true

  def self.model_name
    Carriage.model_name
  end
end
