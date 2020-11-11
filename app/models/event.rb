class Event < ApplicationRecord
  has_many :event_attributes
  has_many :event_registrations
end
