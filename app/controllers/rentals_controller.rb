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
    @ski = Ski.find(params[:ski_id])
    @rental.ski = @ski
    @rental.user = current_user

    @rental.save
    redirect_to my_rentals_path
  end

  def my_rentals
    @rentals = Rental.where(user: current_user)
  end

private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
