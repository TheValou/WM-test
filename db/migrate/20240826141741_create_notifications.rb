class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.integer :priority
      t.integer :moment
      t.references :phase, null: false, foreign_key: true
      t.text :messages, default: [].to_yaml

      t.timestamps
    end
  end
end
