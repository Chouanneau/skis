class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @rental = Rental.new
    @ski = Ski.find(params[:ski_id])
  end

  def create
    @rental = Rental.new(rental_params)
    @rental = Rental.find(params[:rental_id])

    @rental.ski = @ski

    if @rental.save
      redirect_to rentals_path
    else
      render :new
    end
  end

private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
