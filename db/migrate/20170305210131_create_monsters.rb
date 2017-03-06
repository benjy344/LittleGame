class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :hp
      t.integer :force
      t.integer :agility
      t.integer :exp
      t.string :element

      t.timestamps
    end
  end
end
