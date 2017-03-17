class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.string :name,  null: false
      t.string :element,  null: false
      t.integer :hp , default: 20
      t.integer :level, default: 1
      t.integer :exp, default: 0
    end
  end
end
