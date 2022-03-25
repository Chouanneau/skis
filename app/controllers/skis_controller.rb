class SkisController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show
 #GET all the skis
  def index
    if params[:query].present?
      sql_query = " \
        skis.brand ILIKE :query \
        OR skis.description ILIKE :query \
      "
      @skis = Ski.all.where(sql_query, query: "%#{params[:query]}%")
    else
      @skis = Ski.all
    end
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url("")
      }
    end
  end

  #SHOW the skis selected
  def show
    @ski = Ski.find(params[:id])
  end

#NEW & CREATE a new pair of skis
def new
  @ski = Ski.new
end

def create
  @ski = Ski.new(ski_params)
  @ski.user = current_user

  if @ski.save
    redirect_to skis_path
  else
    render :new
  end
end

def my_skis
  @skis = Ski.where(user: current_user)
end

def destroy
  @ski = Ski.find(params[:id])
  @ski.destroy
  redirect_to my_skis_path
end


private

  def ski_params
    params.require(:ski).permit(:brand, :description, :sizing, :category, :price, :title, :photo)
  end
end
