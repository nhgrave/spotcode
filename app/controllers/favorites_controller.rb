class FavoritesController < ApplicationController
  def index
    @albums = current_user.favorites.where(favoritable_type: "Album").map(&:favoritable)
    @songs = current_user.favorites.where(favoritable_type: "Song").map(&:favoritable)
    @artists = current_user.favorites.where(favoritable_type: "Artist").map(&:favoritable)
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
