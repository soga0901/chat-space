class Group < ApplicationRecord
  has_many :group_users
  has_many :users, :through => :user_groups
  has_many :messages
end
