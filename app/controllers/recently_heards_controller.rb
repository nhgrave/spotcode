class RecentlyHeardsController < ApplicationController
  def create
    @recetly_heard = current_user.recently_heards.build album_id: params[:album_id]

    @recetly_heard.save

    head :ok
  end
end
