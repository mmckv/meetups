class UsersEvent < ActiveRecord::Base
  validates :user_id, presence: true, numericality: true
  validates :event_id, presence: true, numericality: true

  belongs_to :user
  belongs_to :event
end
