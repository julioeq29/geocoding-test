class FlatsController < ApplicationController
  def index
    @flats = Flat.geocoded # returns flats with coordinates

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lon: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat }),
        image_url: helpers.asset_url('parrot.gif')
      }
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address)
  end
end
