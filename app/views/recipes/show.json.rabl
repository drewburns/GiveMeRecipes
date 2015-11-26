object @recipe
attributes :id, :name, :ingredients , :instructions

child :user do
  attributes :id, :email
  node(:url) { |user| user_url(user) }
end
