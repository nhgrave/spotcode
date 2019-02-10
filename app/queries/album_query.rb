class AlbumQuery
  def initialize relation = Album, user: nil
    @relation = relation
    @user = user
  end

  def recently_heard
    return @recently_heard if @recently_heard.present?

    album_ids = @user.recently_heards
      .order("created_at DESC")
      .pluck(:album_id)
      .uniq
      .first(4)

    @recently_heard = @relation.where id: album_ids
  end

  def recommentations
    category_ids = recently_heard.pluck(:category_id).uniq

    @relation.joins(:songs)
      .where(category_id: category_ids)
      .order("songs.played_count")
      .limit(4)
  end
end
