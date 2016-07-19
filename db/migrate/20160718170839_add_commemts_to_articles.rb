class AddCommemtsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :comment, :text
  end
end
