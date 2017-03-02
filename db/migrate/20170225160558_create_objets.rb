class CreateObjets < ActiveRecord::Migration[5.0]
  def change
    create_table :objets do |t|
      t.string :name
      t.integer :rarity
      t.integer :health
      t.integer :force
      t.integer :agility
      t.integer :magic
    end
  end
end
