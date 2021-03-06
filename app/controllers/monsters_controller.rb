class MonstersController < ApplicationController
  before_action :set_monster, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /monsters
  # GET /monsters.json
  def index
    @monsters = Monster.all
  end

  # GET /monsters/1
  # GET /monsters/1.json
  def show
    @objects = Objet.all
  end

  # GET /monsters/new
  def new
    @monster = Monster.new
  end

  # GET /monsters/1/edit
  def edit
  end

  # POST /monsters
  # POST /monsters.json
  def create
    @monster = Monster.new(monster_params)
    respond_to do |format|
      if @monster.save
        format.html { redirect_to @monster, notice: 'Monster was successfully created.' }
        format.json { render :show, status: :created, location: @monster }
      else
        format.html { render :new }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  def addObjetById
    @monster = Monster.find(params[:monster_id])
    @obj = Objet.find(params[:objet_id])

    @monster.objets << @obj

    respond_to do |format|
        format.html { redirect_to donjons_path, notice: 'monster was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster }
        format.js
    end

  end

  def removeObjetById
    @monster = Room.find(params[:room_id]).monsters.where(id: params[:monster_id]).first
    @bag = @monster.bag_monsters.where(objet_id: params[:objet_id]).first
    @monster.bag_monsters.delete(@bag)
    #@donjon = Donjon.find(params[:donjon_id])
    respond_to do |format|
        format.html { redirect_to :back, notice: 'Avatar was successfully updated.' }
        format.json { render :show, status: :ok, location: @avatar }
        format.js
    end

  end

  # PATCH/PUT /monsters/1
  # PATCH/PUT /monsters/1.json
  def update
    respond_to do |format|
      if @monster.update(monster_params)
        format.html { redirect_to @monster, notice: 'Monster was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster }
      else
        format.html { render :edit }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monsters/1
  # DELETE /monsters/1.json
  def destroy
    @monster.destroy
    respond_to do |format|
      format.html { redirect_to monsters_url, notice: 'Monster was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster
      @monster = Monster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_params
      params.require(:monster).permit(:name, :hp, :force, :agility, :exp, :element, :inteligence, :defence, :force, objet_ids: [])
    end
end
