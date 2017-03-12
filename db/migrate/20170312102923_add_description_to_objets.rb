class AddDescriptionToObjets < ActiveRecord::Migration[5.0]
  def change
    add_column :objets, :description, :string
  end
end
