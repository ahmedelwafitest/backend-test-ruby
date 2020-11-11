class CreateEventAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :event_attributes do |t|
      t.string :name, null: false
      t.string :data_type, null: false
      t.boolean :required, null: false, default: false
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
