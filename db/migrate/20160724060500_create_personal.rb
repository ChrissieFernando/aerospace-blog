class CreatePersonal < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.string :personal
      t.integer :userid
      t.integer :articleid
      t.timestamps
    end
  end
end
