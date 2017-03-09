class CreateOirs < ActiveRecord::Migration[5.0]
  def change
  	create_table :oirs do |t|
    	t.references :objet, foreign_key: true
        t.references :room, foreign_key: true
    end
  end
end
