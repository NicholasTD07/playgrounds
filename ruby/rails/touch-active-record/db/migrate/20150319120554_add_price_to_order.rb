class AddPriceToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :price, :integer
  end
end
