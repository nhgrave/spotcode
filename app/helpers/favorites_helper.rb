module FavoritesHelper
  def favorite_button favoritable
    if current_user.favorites.where(favoritable: favoritable).exists?
      render_favorite_button favoritable.id, favoritable.model_name.name, :delete, :fas
    else
      render_favorite_button favoritable.id, favoritable.model_name.name, :post, :far
    end
  end

  private
    def render_favorite_button id, type, method, icon
      url = send "#{type.downcase}_favorite_path", "#{type.downcase}_id": id, id: id

      link_to url, class: "has-text-white", data: { remote: true, method: method, favoritable: "#{type.downcase}_#{id}" } do
        content_tag :i, "", class: [ icon, "fa-heart fa-2x" ].join(" ")
      end
    end
end
