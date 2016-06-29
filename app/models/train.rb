class Train < ActiveRecord::Base
  belongs_to :current_station, class_name:  'Station',
                               foreign_key: :current_station_id
  belongs_to :route
  has_many   :tickets
  has_many   :carriages

  validates :number, presence: true

  def carriages_numeration
    if numeration
      carriages.start_numeration
    else
      carriages.end_numeration
    end
  end

  # def count_all_carriages(carriage_type, berth_type)
  #   collection = carriages.where(carriage_type: carriage_type).select(berth_type)
  #   collection.inject(0) do |sum, carriage|
  #     sum += carriage.send berth_type
  #   end
  # end
end
