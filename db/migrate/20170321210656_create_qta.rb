class CreateQta < ActiveRecord::Migration[5.0]
  def change
    create_table :qta do |t|
    	t.references :avatar, foreign_key: true
       t.references :quete, foreign_key: true
       t.string :state, default: "lock"
    end
  end
end
