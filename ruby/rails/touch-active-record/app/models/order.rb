class Order < ActiveRecord::Base
  belongs_to :customer, touch: true
end
