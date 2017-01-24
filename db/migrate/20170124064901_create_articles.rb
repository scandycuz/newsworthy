class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false, index: true
      t.string :url, null: false
      t.integer :sentiment
      t.integer :anger
      t.integer :disgust
      t.integer :fear
      t.integer :joy
      t.integer :sadness
      t.timestamps null: false
    end
  end
end
