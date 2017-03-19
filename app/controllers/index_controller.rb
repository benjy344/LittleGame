class IndexController < ApplicationController

	def gameover
		@avatar = current_user.avatar
		@gold = @avatar.money - (@avatar.money*0.4)
		@avatar.update(money: @gold, hp: 1)
	end

	def town
		@avatar = current_user.avatar
		@objets = Objet.all
		@objetDroguery = Objet.where('category = "Santé" OR category= "Pierre Magique" OR category = "Matériaux"').order(:price)
		@objetForge = Objet.where('category = "Armure" OR category= "Arme" OR category = "Défence"').order(:price)
	end
end
