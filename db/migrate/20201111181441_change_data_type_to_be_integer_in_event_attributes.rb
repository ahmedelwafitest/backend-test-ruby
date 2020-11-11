class ChangeDataTypeToBeIntegerInEventAttributes < ActiveRecord::Migration[5.1]
  def change
    change_column :event_attributes, :data_type, :integer, default: 0
  end
end
