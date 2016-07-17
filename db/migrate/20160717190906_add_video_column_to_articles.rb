class AddVideoColumnToArticles < ActiveRecord::Migration
  def change
      add_column :articles, :video, :text
  end
end
