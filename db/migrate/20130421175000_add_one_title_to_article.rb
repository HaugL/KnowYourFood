class AddOneTitleToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :main_title, :string
  end
end
