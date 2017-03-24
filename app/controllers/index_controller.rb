class IndexController < ApplicationController
	def gameover
		@avatar = current_user.avatar
		@gold = @avatar.money - (@avatar.money*0.4)
		if @avatar.countUnlockDonjon === 1
			@hpFirst = @avatar.MaxHealth/2
			@avatar.update(money: @gold, hp: @hpFirst)
		else
			@avatar.update(money: @gold, hp: 1)
		end
	end

	def town
		@quetes = Quete.all
		@avatar = current_user.avatar
		@objetDroguery = Objet.where('category = "Santé" OR category= "Pierre Magique" OR category = "Matériaux"').order(:price)
		@objetForge = Objet.where('category = "Armure" OR category= "Arme" OR category = "Défence"').order(:price)
	end
end
