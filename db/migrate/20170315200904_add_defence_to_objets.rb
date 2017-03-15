class AddDefenceToObjets < ActiveRecord::Migration[5.0]
  def change
    add_column :objets, :defence, :integer
  end
end
