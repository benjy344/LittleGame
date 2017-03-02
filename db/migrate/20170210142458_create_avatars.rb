class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.string :name
      t.string :element
      t.integer :hp
      t.integer :level
      t.integer :exp

      t.timestamps
    end
  end
end
