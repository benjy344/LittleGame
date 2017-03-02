class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.string :name
      t.string :element
      t.integer :hp , default: 20
      t.integer :level, default: 5
      t.integer :exp, default: 0

      t.timestamps
    end
  end
end
