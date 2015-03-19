class Relationship < ActiveRecord::Base
  belongs_to :user, touch: true
  belongs_to :other_user, class_name: 'User'
end
