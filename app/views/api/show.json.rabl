object @recipe
attributes :id, :name, :ingredients , :instructions , :picture ,:description

child :user do
  attributes :id, :email
  node(:url) { |user| user_url(user) }
  child :api_keys do
  	attributes :access_token
  end
end


