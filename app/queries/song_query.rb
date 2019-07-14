class SongQuery
  def initialize relation = Song
    @relation = relation
  end

  def from_category category
    @relation.joins(album: :category)
      .where(categories: { id: category.id })
      .distinct
  end
end
