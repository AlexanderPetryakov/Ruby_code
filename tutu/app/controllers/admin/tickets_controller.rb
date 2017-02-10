class Admin::TicketsController < Admin::BaseController
  
  	before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

	def new
    @ticket = Ticket.new(train_id: params[:train_id], departure_station_id: params[:departure_station_id],
      arrival_station_id: params[:arrival_station_id], user_id: params[:user_id])
  end

  def show
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to admin_ticket_path(@ticket)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to admin_ticket_path(@ticket)
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path, notice: 'Ticket was successfully destroyed.'
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:train_id, :departure_station_id, :arrival_station_id,
      :passenger_name, :passport_number, :user_id)
  end

end
