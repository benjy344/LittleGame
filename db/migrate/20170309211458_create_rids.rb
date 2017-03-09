class CreateRids < ActiveRecord::Migration[5.0]
  def change
    create_table :rids do |t|
    	t.references :room, foreign_key: true
        t.references :donjon, foreign_key: true
    end
  end
end
