class IndexArticleTitles < ActiveRecord::Migration
  def change
    remove_index :articles, :title
    add_index :articles, :title, unique: true
  end
end
