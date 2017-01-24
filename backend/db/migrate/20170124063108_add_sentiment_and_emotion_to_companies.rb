class AddSentimentAndEmotionToCompanies < ActiveRecord::Migration
  def change
    rename_column :companies, :rating, :sentiment
  end
end
