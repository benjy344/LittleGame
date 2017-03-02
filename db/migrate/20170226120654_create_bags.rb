class CreateBags < ActiveRecord::Migration[5.0]
  def change
    create_table :bags do |t|
      t.references :avatar, foreign_key: true
      t.references :objet, foreign_key: true
     end
  end
end
