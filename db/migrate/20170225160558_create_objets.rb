class CreateObjets < ActiveRecord::Migration[5.0]
  def change
    create_table :objets do |t|
      t.string :name
      t.integer :rarity, default: 0
      t.integer :health, default: 0
      t.integer :force, default: 0
      t.integer :agility, default: 0
      t.integer :magic, default: 0
      t.integer :price, default: 0
      t.integer :defence, default: 0
    end
  end
end
