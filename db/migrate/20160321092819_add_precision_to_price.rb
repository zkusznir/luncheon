class AddPrecisionToPrice < ActiveRecord::Migration
  def change
    change_column :meals, :price, :decimal, precision: 20, scale: 2
  end
end
