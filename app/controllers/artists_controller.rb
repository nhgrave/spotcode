class ArtistsController < ApplicationController
  def show
    @artist = Artist.find params.require(:id)
  end
end
