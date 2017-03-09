class CreateMirs < ActiveRecord::Migration[5.0]
  def change
    create_table :mirs do |t|
    	t.references :room, foreign_key: true
      	t.references :monster, foreign_key: true
    end
  end
end
