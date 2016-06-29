class Carriage < ActiveRecord::Base
  DESCENDANTS = [EconomyCarriage, CoupeCarriage, SleepingCarriage, SittingCarriage].map(&:name).freeze
  
  scope :start_numeration, -> { order(:number) }
  scope :end_numeration, -> { start_numeration.reverse_order }

  belongs_to :train

  validates :number, presence: true, uniqueness: { scope: :train_id }

  before_validation :set_carriage_number

  private

  def set_carriage_number
    self.number ||= self.train.carriages.present? ? self.train.carriages.maximum(:number) + 1 : 1
  end
end
