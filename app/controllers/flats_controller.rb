class FlatsController < ApplicationController
  def index
    @flats = Flat.geocoded # returns flats with coordinates

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lon: flat.longitude
      }
    end
  end
end
