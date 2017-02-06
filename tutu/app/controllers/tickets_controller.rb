class TicketsController < ApplicationController

	before_action :set_ticket, only: :show

	def new
    @ticket = Ticket.new(train_id: params[:train_id], departure_station_id: params[:departure_station_id],
      arrival_station_id: params[:arrival_station_id])
  end

  def show
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :departure_station_id, :arrival_station_id,
      :passenger_name, :passport_number)
  end

end
