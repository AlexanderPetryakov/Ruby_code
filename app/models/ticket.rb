class Ticket < ApplicationRecord

  belongs_to :train
  belongs_to :departure_station, class_name: 'RailwayStation', foreign_key: :departure_station_id
  belongs_to :arrival_station, class_name: 'RailwayStation', foreign_key: :arrival_station_id
  belongs_to :user

  after_create :send_confirmation
  before_destroy :send_notification

  def route_name
    "#{departure_station.title} - #{arrival_station.title}"
  end

  private

  def send_confirmation
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_notification
    TicketsMailer.cancel_ticket(self.user, self).deliver_now
  end
end
