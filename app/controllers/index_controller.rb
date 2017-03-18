class IndexController < ApplicationController

	def gameover
		@avatar = current_user.avatar
		@gold = @avatar.money - (@avatar.money*0.4)
		@avatar.update(money: @gold, hp: 1)
	end
end
