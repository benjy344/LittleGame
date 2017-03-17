class RoomsController < ApplicationController
	before_action :set_room, only: [:show, :edit, :update, :destroy]
	before_action :all_rooms, only: [:index, :create]
	before_action :authenticate_user!
  load_and_authorize_resource

  	

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Donjon.find(params[:donjon_id]).rooms.includes(:monsters, :objets).all
    @donjon = Donjon.find(params[:donjon_id])
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  	@objets = Objet.all
    @monsters = Monster.includes(:objets).all
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @donjon = Donjon.find(params[:donjon_id])
  end

  # GET /rooms/1/edit
  def edit
  end


  def addObjetByIdToRoom
  	@room = Room.find(params[:room_id])
  	@donjon = @room.donjons.first
    @obj = Objet.find(params[:objet_id])
    @objets = Objet.all
    @monsters = Monster.all

    @room.objets << @obj

    respond_to do |format|
        format.html { redirect_to donjon_room_path(@donjon.id, @room.id), notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
        format.js
    end
  end

  def addGold
    @room = Room.find(params[:id])
    puts "================"
    puts @room.inspect
    puts "================"
    puts "================"
    puts params.permit(:money).inspect
    puts "================"

    puts "================"
    puts params.inspect
    puts "================"

    @room.update(money: params[:money])

    puts "================"
    puts @room.money
    puts "================"

    respond_to do |format|
        format.html { redirect_to :back, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
        format.js
    end
  end

  def addMonsterByIdToRoom
    @room = Room.find(params[:room_id])
    @donjon = @room.donjons.first
    @monster = Monster.find(params[:monster_id])

    @monsters = Monster.all
    @objets = Objet.all
    @room.monsters << @monster

    respond_to do |format|
        format.html { redirect_to :back, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
        format.js
    end
  end
  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(params.require(:room).permit(:name, :donjon_ids))
    @donjon_id = params.require(:room).permit(:name, :donjon_ids)[:donjon_ids]
    respond_to do |format|
      if @room.save
        format.html { redirect_to donjon_room_path(@donjon_id, @room.id), notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def addObjetById
    @room = current_user.room
    @obj = Objet.find(params[:objet_id])

    @room.objets << @obj

    respond_to do |format|
        format.html { redirect_to Donjon.find(1), notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
    end

  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @donjon_id = @room.donjons.first.id
    @room.destroy
    respond_to do |format|
      format.html { redirect_to donjon_rooms_path(@donjon_id), notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end
    def all_rooms
      @rooms = Room.includes(:monsters, :objets).all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:id, :name, :money, objet_ids: [], monster_ids: [], donjon_ids: [])
    end
end
