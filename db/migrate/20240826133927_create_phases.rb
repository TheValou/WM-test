class CreatePhases < ActiveRecord::Migration[7.1]
  def change
    create_table :phases do |t|
      t.string :name
      t.index :name, unique: true
      t.boolean :is_first_cycle_logged
      t.integer :end
      t.integer :start

      t.timestamps
    end
  end
end
