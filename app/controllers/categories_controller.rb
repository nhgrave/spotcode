class CategoriesController < ApplicationController
  def show
    @category = Category.find params.require(:id)
    @albums   = @category.albums
    @artists  = ArtistQuery.new.from_category @category
    @songs    = SongQuery.new.from_category @category
  end
end
