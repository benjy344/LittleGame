class QuetesController < ApplicationController
  before_action :set_quete, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /quetes
  # GET /quetes.json
  def index
    @quetes = Quete.all
  end

  # GET /quetes/1
  # GET /quetes/1.json
  def show
  end

  # GET /quetes/new
  def new
    @quete = Quete.new
  end

  # GET /quetes/1/edit
  def edit
  end

  # POST /quetes
  # POST /quetes.json
  def create
    @quete = Quete.new(quete_params)

    respond_to do |format|
      if @quete.save
        format.html { redirect_to @quete, notice: 'quete was successfully created.' }
        format.json { render :show, status: :created, location: @quete }
      else
        format.html { render :new }
        format.json { render json: @quete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quetes/1
  # PATCH/PUT /quetes/1.json
  def update
    respond_to do |format|
      if @quete.update(quete_params)
        format.html { redirect_to @quete, notice: 'quete was successfully updated.' }
        format.json { render :show, status: :ok, location: @quete }
      else
        format.html { render :edit }
        format.json { render json: @quete.errors, status: :unprocessable_entity }
      end
    end
  end

  def changeStatus
  	@avatar = current_user.avatar
  	@quetes = Quete.all
  	@quete = Quete.find(params[:quete_id])
  	@avatar.quetes << @quete
  	@avatar.qtum.where(quete_id: @quete.id).first.update(state: "progress")
  	respond_to do |format|
      format.html { redirect_to :back, notice: 'quete was successfully update.' }
      format.json { head :no_content }
      format.js
    end
  	
  end
  def finishQuest
  	@avatar = current_user.avatar
  	@quetes = Quete.all
  	@quete = Quete.find(params[:quete_id])

  	@bag = @avatar.bags.where(objet_id: @quete.objetToFind).first
    @avatar.bags.delete(@bag)

  	if @quete.rewardType === "Or"
  		@reward = @quete.reward
  		@currentGold = @avatar.money
  		@newGold = @currentGold + @reward
  		@avatar.update(money: @newGold)
  	else
  		@reward = Objet.find(@quete.reward)
  		@avatar.objets << @reward 
  	end
  	 
    @objetDroguery = Objet.where('category = "Santé" OR category= "Pierre Magique" OR category = "Matériaux"').order(:price)
    @objetForge = Objet.where('category = "Armure" OR category= "Arme" OR category = "Défence"').order(:price)
  	@avatar.qtum.where(quete_id: @quete.id).first.update(state: "completed")

  	respond_to do |format|
      format.html { redirect_to :back, notice: 'quete was successfully update.' }
      format.json { head :no_content }
      format.js
    end
  	
  end

  # DELETE /quetes/1
  # DELETE /quetes/1.json
  def destroy
    @quete.destroy
    respond_to do |format|
      format.html { redirect_to quetes_url, notice: 'quete was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quete
      @quete = Quete.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quete_params
      params.require(:quete).permit(:title, :description, :unlockLevel, :rewardType, :done, :reward, :objetToFind)
    end


end
