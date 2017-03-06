class AddStrongToAvatar < ActiveRecord::Migration[5.0]
  def change
  	add_column :avatars, :force, :integer, default: 5
  	add_column :avatars, :agility, :integer, default: 5
  	add_column :avatars, :inteligence, :integer, default: 5
  	add_column :monsters, :inteligence, :integer
  end
end
