class CreateSourceTypes < ActiveRecord::Migration
  def up
    create_table :source_types do |t|
  		t.string :name
      t.timestamps
    end
  end

  def down
  	drop_table :source_types
  end
end
