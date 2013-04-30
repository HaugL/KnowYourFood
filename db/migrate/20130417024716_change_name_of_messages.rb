class ChangeNameOfMessages < ActiveRecord::Migration
  def up
  	rename_table :messages, :admin_messages
  end

  def down
  end
end
