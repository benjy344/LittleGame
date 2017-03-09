class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :agility
      t.integer :strong
      t.integer :intelligence
    end
  end
end
