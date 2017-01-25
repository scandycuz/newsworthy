class AddPrevValuesToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :prev_sentiment, :decimal, :default => 0
    add_column :companies, :prev_anger, :decimal, :default => 0
    add_column :companies, :prev_disgust, :decimal, :default => 0
    add_column :companies, :prev_fear, :decimal, :default => 0
    add_column :companies, :prev_joy, :decimal, :default => 0
    add_column :companies, :prev_sadness, :decimal, :default => 0
  end
end
