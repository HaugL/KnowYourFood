class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :message
      t.integer :user_id
      t.integer :admin_id
      t.integer :message_type_id
      t.integer :message_id
      t.boolean :replied, :default => false
      t.timestamps
    end
  end
end
