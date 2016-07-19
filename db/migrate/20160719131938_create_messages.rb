class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :messages
      t.text :user_name
      t.timestamps
    end
  end
end
