class CreateDatapoints < ActiveRecord::Migration
  def change
    create_table :datapoints do |t|
      t.integer :company_id, null: false
      t.integer :article_id, null: false
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
