class AddMeals < ActiveRecord::Migration
  def change
  	create_table :meals do |t|
    	t.references :user, index: true, foreign_key: true
    	t.references :recipe, index: true, foreign_key: true
    	t.date :for_date
      t.timestamps null: false
    end
  end
end
