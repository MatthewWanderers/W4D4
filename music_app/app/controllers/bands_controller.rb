class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = current_band
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:sucess] = "Successfully Added #{@band.name}"
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    @band = current_band
    @band.destroy!
  end

  def edit
    @band = current_band
    render :edit
  end

  def update
    @band = current_band
    if @band.update_attributes
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
  end

  private

  def bands_params
    params.require(:bands).permit(:name)
  end

  def current_band
    Band.find(params[:id])
  end
end
