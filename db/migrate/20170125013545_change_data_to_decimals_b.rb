class ChangeDataToDecimalsB < ActiveRecord::Migration
  def change
    change_column :datapoints, :sentiment, :decimal
    change_column :datapoints, :anger, :decimal
    change_column :datapoints, :disgust, :decimal
    change_column :datapoints, :fear, :decimal
    change_column :datapoints, :joy, :decimal
    change_column :datapoints, :sadness, :decimal
    change_column :companies, :sentiment, :decimal
    change_column :companies, :anger, :decimal
    change_column :companies, :disgust, :decimal
    change_column :companies, :fear, :decimal
    change_column :companies, :sadness, :decimal
    change_column :articles, :sentiment, :decimal
    change_column :articles, :anger, :decimal
    change_column :articles, :disgust, :decimal
    change_column :articles, :fear, :decimal
    change_column :articles, :joy, :decimal
    change_column :articles, :sadness, :decimal
  end
end
