class AddMoneyToAvatar < ActiveRecord::Migration[5.0]
  def change
    add_column :avatars, :money, :integer, default: 0
    add_column :avatars, :id_defObject, :integer
    add_column :avatars, :id_armure, :integer
    add_column :avatars, :nextLevel, :integer, default: 50
    add_column :avatars, :defence, :integer, default: 5
    add_column :rooms, :money, :integer, default: 0
  end
end
