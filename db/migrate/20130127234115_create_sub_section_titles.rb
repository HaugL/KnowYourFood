class CreateSubSectionTitles < ActiveRecord::Migration
  def change
    create_table :sub_section_titles do |t|
      t.integer :section_title_id
      t.string :title
      t.timestamps
    end
  end
end
