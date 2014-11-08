def full_title(page_title)
  base_title = APP_NAME
  if page_title.empty?
    base_title
  else
    "#{page_title} | #{base_title}"
  end
end

def login(user)
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    'provider' => user.provider,
    'uid' => user.id,
    'nickname' => user.nickname,
    'image_url' => user.image_url,
    'visiting_count' => 0,
    'trophy_count' => 0
    })
  post '/auth/twitter/callback'
end
# def sign_in(user, options={})
#   if options[:no_capybara]
#     remember_token = User.new_remember_token
#     cookies[:remember_token] = remember_token
#     user.update_attribute(:remember_token, User.encrypt(remember_token))
#   else
#     visit signin_path
#     fill_in "Email",    with: user.email
#     fill_in "Password", with: user.password
#     click_button "Sign in"
#   end
# end
