class SearchController < ApplicationController
  def index
    @songs   = Song.where "title ILIKE ?", "%#{params[:search]}%"
    @albums  = Album.where "title ILIKE ?", "%#{params[:search]}%"
    @artists = Artist.where "name ILIKE ?", "%#{params[:search]}%"
  end

  def new
    @categories = Category.all
  end
end
