class EventAttribute < ApplicationRecord
  include DataTypeEnumConcern
  belongs_to :event

  validates :name, uniqueness: { scope: :event_id}
  validates :name, :data_type, presence: true
end
