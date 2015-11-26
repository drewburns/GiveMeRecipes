object @recipe
attributes :id, :name, :ingredients , :instructions , :picture

child :user do
  attributes :id, :email
  node(:url) { |user| user_url(user) }
end
