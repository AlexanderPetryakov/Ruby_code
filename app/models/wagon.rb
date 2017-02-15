class Wagon < ApplicationRecord

  belongs_to :train

  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_wagon_number, if: :train_id_changed?

  TYPES = %w(CoupeWagon DayWagon EconomyWagon LuxuryWagon).freeze

  scope :by_number, -> (order) { order(number: order ? 'ASC' : 'DESC' ) }

  private

  def set_wagon_number
    max_number = train.wagons.maximum(:number).to_i
    self.number = max_number + 1 
  end

end
