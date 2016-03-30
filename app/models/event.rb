class Event < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :users_events
  has_many :users, through: :users_events
end
