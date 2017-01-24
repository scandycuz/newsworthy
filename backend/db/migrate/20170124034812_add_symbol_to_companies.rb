class AddSymbolToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :symbol, :string
    add_index :companies, :symbol, unique: true
  end
end
