class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :other_user, class_name: 'User'
end
