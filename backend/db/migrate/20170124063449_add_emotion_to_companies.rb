class AddEmotionToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :anger, :integer
    add_column :companies, :disgust, :integer
    add_column :companies, :fear, :integer
    add_column :companies, :joy, :integer
    add_column :companies, :sadness, :integer
  end
end
