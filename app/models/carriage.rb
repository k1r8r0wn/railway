class Carriage < ActiveRecord::Base
  belongs_to :train

  validates :number, :upper_berths, :lower_berths, presence: true

  # default_scope { order(:number) }

  scope :economy_carriage, -> { where(carriage_type: 'sleeping') }
  scope :coupe_carriage, -> { where(carriage_type: 'coupe') }
  scope :ordered, -> { order(:number) }
end
