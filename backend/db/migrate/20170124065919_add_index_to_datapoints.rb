class AddIndexToDatapoints < ActiveRecord::Migration
  def change
    add_index :datapoints, :company_id
    add_index :datapoints, :article_id
    add_column :articles, :company_id, :integer
    add_index :articles, :company_id
  end
end
