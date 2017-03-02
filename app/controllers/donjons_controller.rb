class DonjonsController < ApplicationController

	def index
	    @avatars = Avatar.includes(:job, :objets).all
	    @objets = Objet.all
	    @bags = Bag.includes(:avatar, :objet).all
	end

	def update
		@avatar = Avatar.find(params[:avatar_id])
		@objet = Objet.find(params[:objet_id])

		@avatar.objets << @objet
	end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_donjon
      @donjon = Donjon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donjon_params
      params.require(:donjon).permit[:avatar_id, :objet_id]
    end

end
