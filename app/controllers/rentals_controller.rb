class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user

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
