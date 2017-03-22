class AvatarsController < ApplicationController
  #before_action :set_avatar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /avatars
  # GET /avatars.json
  def index
    #authorize! :read, Avatar 
    @avatars = Avatar.includes(:job, :objets).all
  end

  # GET /avatars/1
  # GET /avatars/1.json
  def show
  end

  # GET /avatars/new
  def new
    @avatar = Avatar.new
  end

  # GET /avatars/1/edit
  def edit
  end

  # POST /avatars
  # POST /avatars.json
  def create
    @avatar = Avatar.new(avatar_params)
    @user = current_user
    @user.avatar = @avatar
    respond_to do |format|
      if @avatar.save
        format.html { redirect_to donjon_path(1), notice: 'Avatar was successfully created.' }
        format.json { render :show, status: :created, location: @avatar }
      else
        format.html { render :new }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avatars/1
  # PATCH/PUT /avatars/1.json
  def update
    respond_to do |format|
      if @avatar.update(avatar_params)
        format.html { redirect_to @avatar, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
      else
        format.html { render :edit }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  def unlockNewDonjon
    @avatar = current_user.avatar
    @avatar.update(countUnlockDonjon: params[:level])
    redirect_to town_path
  end


  def equipeObjet
    @avatar = current_user.avatar

    @avatar.update(id_objet_equipe: params[:objet_id])

    respond_to do |format|
        format.html { redirect_to :back, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
        format.js
    end

  end

  def addGold
    @avatar = current_user.avatar
    @currentGold = @avatar.money.to_i
    @newGold = @currentGold + params[:money].to_i
    @avatar.update(money: @newGold)

    respond_to do |format|
        format.html { redirect_to :back, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
        format.js
    end

  end

  def majAvatar 

    @avatar = current_user.avatar
    @avatar.update(MaxHealth: params[:MaxHealth], hp: params[:hp], level: params[:level], nextLevel: params[:nextLevel],defence: params[:defence], agility: params[:agility], force: params[:force], inteligence: params[:inteligence], exp: params[:exp])
    respond_to do |format|
        format.html { redirect_to :back, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
        format.js
    end
  end

  def restorHpWithObject 

    @avatar = current_user.avatar
    @objet = @avatar.objets.where(id: params[:objet_id]).first
    @percent = (@avatar.MaxHealth*(@objet.health/100.00))
    @newhp = @avatar.hp + @percent
    if @newhp > @avatar.MaxHealth
      @newhp = @avatar.MaxHealth
    end
    @avatar.update(hp: @newhp)

    #delete object of the bag
    @bag = @avatar.bags.where(objet_id: params[:objet_id]).first
    @avatar.bags.delete(@bag)

    respond_to do |format|
        format.html { redirect_to :back, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
        format.js
    end
  end

  def addObjetById
    @avatar = current_user.avatar
    @obj = Objet.find(params[:objet_id])
    #@donjon = Donjon.find(params[:donjon_id])

    @avatar.objets << @obj

    respond_to do |format|
        format.html { redirect_to :back, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
        format.js
    end

  end

  def finishDonjon
    @avatar = current_user.avatar
    @LevelWin = Donjon.find(params[:donjon_id]).level + 1
    @currentLevel = @avatar.countUnlockDonjon

    if @LevelWin > @currentLevel
      @currentLevel = @LevelWin
    end

    @avatar.update(countUnlockDonjon: @currentLevel)

    respond_to do |format|
        format.html { redirect_to town_path, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
        format.js
    end

  end

  def payObjetById
    @avatar = current_user.avatar
    @obj = Objet.find(params[:objet_id])
    @price = @obj.price
    @money = @avatar.money - @price

    @avatar.update(money: @money)
    @avatar.objets << @obj

    @objetDroguery = Objet.where('category = "Santé" OR category= "Pierre Magique" OR category = "Matériaux"').order(:price)
    @objetForge = Objet.where('category = "Armure" OR category= "Arme" OR category = "Défence"').order(:price)

    respond_to do |format|
        format.html { redirect_to :back, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
        format.js
    end

  end

  def rest
    @avatar = current_user.avatar
    @money = @avatar.money - 3

    @avatar.update(hp: @avatar.MaxHealth, money: @money)
    @objetDroguery = Objet.where('category = "Santé" OR category= "Pierre Magique" OR category = "Matériaux"').order(:price)
    @objetForge = Objet.where('category = "Armure" OR category= "Arme" OR category = "Défence"').order(:price)
    respond_to do |format|
        format.html { redirect_to :back, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
        format.js
    end

  end

  def removeObjetById
    @avatar = current_user.avatar
    @bag = @avatar.bags.where(objet_id: params[:objet_id]).first
    @avatar.bags.delete(@bag)
    respond_to do |format|
        format.html { redirect_to :back, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
        format.js
    end

  end

  # DELETE /avatars/1
  # DELETE /avatars/1.json
  def destroy
    authorize! :destroy, Avatar 
    @avatar.destroy
    respond_to do |format|
      format.html { redirect_to avatars_url, notice: 'Avatar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avatar
      @avatar = Avatar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avatar_params
      params.require(:avatar).permit(:name, :element, :hp, :level, :job_id, :exp, :id_objet_equipe, objet_ids: [])
    end
end
