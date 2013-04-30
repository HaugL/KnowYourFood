class RenameMessageFieldToText < ActiveRecord::Migration
  def up
  	rename_column :admin_messages, :message, :text
  end

  def down
  end
end
