class EconomyCarriage < Carriage
  validates :side_lower_berths, :side_upper_berths, presence: true
end
