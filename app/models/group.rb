class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  accepts_nested_attributes_for :users, allow_destroy: true
  validates :name, presence: true

  def last_message
    group.messages.body = group.messages[:body]
  end

end
