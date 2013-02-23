class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.integer :type_id
      t.integer :article_id
      t.string :title
      t.string :source
      t.string :link
      t.text :notes
      t.timestamps
    end
  end
end
