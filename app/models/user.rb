class User < ApplicationRecord
  include CustomAttributeConcern

  has_many :event_registrations

  serialize :custom_attributes, ActiveSupport::HashWithIndifferentAccess

  def custom_attributes_value
    user_attributes = UserAttribute.all
    merge_attributes(user_attributes, custom_attributes)
  end
end
