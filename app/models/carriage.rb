class Carriage < ActiveRecord::Base
  DESCENDANTS = [EconomyCarriage, CoupeCarriage, SleepingCarriage, SittingCarriage].map(&:name).freeze
  
  # default_scope { order(:number) }

  scope :economy_carriage, -> { where(carriage_type: 'economy') }
  scope :coupe_carriage, -> { where(carriage_type: 'coupe') }
  scope :ordered, -> { order(:number) }

  belongs_to :train

  validates :number, presence: true, uniqueness: { scope: :train_id }

  before_validation :set_carriage_number

  private

  def set_carriage_number
    self.number ||= self.train.carriages.present? ? self.train.carriages.maximum(:number) + 1 : 1
  end
end
