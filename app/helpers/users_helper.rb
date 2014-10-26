module UsersHelper

  def twitter_avatar(user, size=48)
    image_tag(user.image_url, alt: user.nickname, size: "#{size}", class: "avatar size#{size}")
  end

end
