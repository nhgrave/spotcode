class FavoritesController < ApplicationController
  def index
    @albums = Album.where(id: current_user.favorites.where(favoritable_type: "Album").pluck(:favoritable_id))
    @songs = Song.where(id: current_user.favorites.where(favoritable_type: "Song").pluck(:favoritable_id))
    @artists = Artist.where(id: current_user.favorites.where(favoritable_type: "Artist").pluck(:favoritable_id))
  end

  def create
    @favoritable = current_user.favorites.build favoritable_type: params[:favoritable_type], favoritable_id: params[:id]
    @favoritable.save
  end

  def destroy
    @favoritable = current_user.favorites.find_by favoritable_type: params[:favoritable_type], favoritable_id: params[:id]
    @favoritable.destroy
  end
end
