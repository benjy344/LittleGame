class CreateBagMonster < ActiveRecord::Migration[5.0]
  def change
    create_table :bag_monsters do |t|
      t.references :monster, foreign_key: true
      t.references :objet, foreign_key: true
    end
  end
end
