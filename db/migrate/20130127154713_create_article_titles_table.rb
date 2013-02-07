class CreateArticleTitlesTable < ActiveRecord::Migration
  def up
  	create_table :article_titles do |t|
  		t.integer :article_id
  		t.string :title
      t.timestamps
    end
  end

  def down
  end
end
