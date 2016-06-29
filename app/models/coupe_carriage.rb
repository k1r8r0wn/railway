class CoupeCarriage < Carriage
  validates :upper_berths, :lower_berths, presence: true
  validates :side_upper_berths, :side_lower_berths, :sitting_berths, absence: true

  def self.model_name
    Carriage.model_name
  end
end
