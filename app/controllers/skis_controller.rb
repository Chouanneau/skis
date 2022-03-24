class SkisController < ApplicationController

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




private

  def ski_params
    params.require(:ski).permit(:brand, :description, :sizing, :category, :price, :title)
  end

end
