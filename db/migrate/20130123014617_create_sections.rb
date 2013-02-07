class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :section_title_id
      t.text :text
      t.timestamps
    end
  end
end
