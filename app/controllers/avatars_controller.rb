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
    puts "=============="
    puts @user
    puts "=============="
    @user.avatar = @avatar
    respond_to do |format|
      if @avatar.save
        format.html { redirect_to @avatar, notice: 'Avatar was successfully created.' }
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

  def equipeObjet
    @avatar = current_user.avatar

    @avatar.update(id_objet_equipe: params[:objet_id])

    respond_to do |format|
        format.html { redirect_to :back, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
        format.js
    end

  end


  def addObjetById
    puts "=============="
    @avatar = current_user.avatar
    puts "=============="
    puts @avatar
    puts "=============="
    @obj = Objet.find(params[:objet_id])
    #@donjon = Donjon.find(params[:donjon_id])

    @avatar.objets << @obj

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
    #@donjon = Donjon.find(params[:donjon_id])
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
