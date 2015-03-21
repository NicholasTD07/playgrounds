class Order < ActiveRecord::Base
  belongs_to :customer, touch: true
  belongs_to :big_customer, foreign_key: 'customer_id', class_name: 'BigCustomer', touch: true
end
