class FlatsController < ApplicationController
  before_action :find_flat, only: [ :show ]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      flash[:message] = "Flat created"
      redirect_to flat_path(@flat)
    else
      flash[:message] = "Form incomplete"
      render :new
    end
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

end
