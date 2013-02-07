class CreateSubSectionTable < ActiveRecord::Migration
  def up
  	create_table :sub_sections do |t|
  		t.integer :sub_section_title_id
  		t.text :text
      t.timestamps
    end
  end

  def down
  end
end
