class ArtistQuery
  def initialize relation = Artist
    @relation = relation
  end

  def from_category category
    @relation.joins(albums: :category)
      .where(categories: { id: category.id })
      .distinct
  end
end
