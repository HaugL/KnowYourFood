class CreateSectionTitles < ActiveRecord::Migration
  def change
    create_table :section_titles do |t|
      t.integer :article_id
      t.string :title
      t.timestamps
    end
  end
end
