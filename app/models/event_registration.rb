class EventRegistration < ApplicationRecord
  include CustomAttributeConcern
  belongs_to :event
  belongs_to :user
  has_many :event_attributes, through: :event

  serialize :custom_attributes, ActiveSupport::HashWithIndifferentAccess

  def custom_attributes_value
    e_attributes = event_attributes.to_a
    merge_attributes(e_attributes, custom_attributes)
  end

end
