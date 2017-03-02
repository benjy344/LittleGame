class AddMaxHealthToAvatar < ActiveRecord::Migration[5.0]
  def change
    add_column :avatars, :MaxHealth, :integer, default: 20
  end
end
