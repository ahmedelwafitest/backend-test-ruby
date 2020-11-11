class CreateUserAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_attributes do |t|
      t.string :name, null: false
      t.string :data_type, null: false
      t.boolean :profilerequired, null: false, default: false
      t.boolean :signuprequired, null: false, default: false
      t.timestamps
    end
  end
end
