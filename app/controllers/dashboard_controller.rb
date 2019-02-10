class DashboardController < ApplicationController
  def index
    query = AlbumQuery.new user: current_user

    @recent_albums = query.recently_heard

    @recommended_albums = query.recommentations
  end
end
