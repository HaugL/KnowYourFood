class AddCommentsTable < ActiveRecord::Migration
  def up
  	create_table :comments do |t|
  		t.integer :article_id
  		t.integer :user_id
  		t.integer :rank
  		t.text :text
      	t.timestamps
    end
  end

  def down
  	drop_table :comments
  end
end
