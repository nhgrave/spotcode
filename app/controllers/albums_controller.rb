class AlbumsController < ApplicationController
  def show
    @album = Album.find params.require(:id)
  end
end
