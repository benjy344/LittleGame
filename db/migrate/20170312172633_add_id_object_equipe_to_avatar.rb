class AddIdObjectEquipeToAvatar < ActiveRecord::Migration[5.0]
  def change
  	add_column :avatars, :id_objet_equipe, :integer
  end
end
