class ChangeDataTypeToBeIntegerInUserAttributes < ActiveRecord::Migration[5.1]
  def change
    change_column :user_attributes, :data_type, :integer, default: 0
  end
end
