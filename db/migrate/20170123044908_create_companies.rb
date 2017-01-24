class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title, null: false, unique: true, index: true
      t.integer :rating, null:false, :default => 0
      t.timestamps null: false
    end
  end
end
