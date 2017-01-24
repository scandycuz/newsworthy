class AddDefaultToCompanyEmotions < ActiveRecord::Migration
  def change
    change_column :companies, :anger, :integer, :default => 0
    change_column :companies, :disgust, :integer, :default => 0
    change_column :companies, :fear, :integer, :default => 0
    change_column :companies, :joy, :integer, :default => 0
    change_column :companies, :sadness, :integer, :default => 0
  end
end
