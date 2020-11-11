class UserAttribute < ApplicationRecord
  include DataTypeEnumConcern
  validates :name, uniqueness: true
  validates :name, :data_type, presence: true
end
