class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name, null: false, index: true, unique: true
      t.integer :data, null: false
      t.timestamps null: false
    end
  end
end
