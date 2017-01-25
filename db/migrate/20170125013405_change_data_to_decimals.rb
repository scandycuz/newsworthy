class ChangeDataToDecimals < ActiveRecord::Migration
  def change
    change_column :companies, :joy, :decimal
  end
end
