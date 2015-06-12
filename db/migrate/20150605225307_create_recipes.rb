class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.references :user, index: true, foreign_key: true
    	t.string :name
    	t.string :description
    	t.string :ingredients
    	t.string :instructions
      t.timestamps null: false
    end
  end
end

# class CreateMeals < ActiveRecord::Migration
#   def change
#     create_table :meals do |t|
#     	t.references :user, index: true, foreign_key: true
#     	t.references :recipe, index: true, foreign_key: true

#       t.timestamps null: false
#     end
#   end
# end
