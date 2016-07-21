class AddFilesColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles ,:files, :string
  end
end
