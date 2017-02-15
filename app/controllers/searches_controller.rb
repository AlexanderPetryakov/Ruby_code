class SearchesController < ApplicationController
  
  def show
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.perform_search
    render :show
  end

  private

  def search_params
    params.require(:search).permit(:departure_station_id, :arrival_station_id)
  end

end
