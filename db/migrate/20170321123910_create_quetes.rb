class CreateQuetes < ActiveRecord::Migration[5.0]
  def change
    create_table :quetes do |t|
    	t.string :title,  null: false
    	t.string :description,  null: false
    	t.integer :unlockLevel
    	t.string :done
    	t.integer :type
    	t.integer :objetToFind
    	t.integer :reward
    end
  end
end
