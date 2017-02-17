class Route < ApplicationRecord
  
  has_many :railway_stations_routes, dependent: :destroy
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :title, presence: true
  validate :stations_count

  before_validation :set_title

  private

  def set_title
    self.title = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Route should contain at least 2 stations")
    end
  end

end
