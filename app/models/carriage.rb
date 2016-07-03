class Carriage < ActiveRecord::Base

  AVAILABLE_CARRIAGES = [EconomyCarriage, CoupeCarriage, SleepingCarriage, SittingCarriage].map(&:name).freeze
  
  scope :start_numeration, -> { order(:number) }
  scope :end_numeration, -> { start_numeration.reverse_order }

  belongs_to :train

  before_create :set_carriage_number

  private

  def set_carriage_number
    self.number ||= train.carriages.empty? ? 1 : train.carriages.last.number + 1
  end
end
