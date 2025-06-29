class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, class_name: "Attend"
  has_many :attendees, through: :attendances, source: :user
end
