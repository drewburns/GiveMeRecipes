object @user
attributes :id, :email
node(:key) {|user| user.api_keys.last.access_token }