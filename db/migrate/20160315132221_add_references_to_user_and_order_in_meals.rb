class AddReferencesToUserAndOrderInMeals < ActiveRecord::Migration
  def change
    add_column :meals, :user_id, :integer
    add_column :meals, :order_id, :integer
  end
end
