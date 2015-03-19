class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders, :customers
  end
end
