class DonjonsController < ApplicationController
	before_action :authenticate_user!
	def index
	    @avatars = Avatar.includes(:job, :objets).all
	    @objets = Objet.all
	    @bags = Bag.includes(:avatar, :objet).all
	    @monsters = Monster.includes(:objets).all
	    @donjons = Donjon.all
	end

  # GET /avatars/1
  # GET /avatars/1.json
  def show
  	@avatars = Avatar.includes(:job, :objets).all
    @objets = Objet.all
    @bags = Bag.includes(:avatar, :objet).all
    @monsters = Monster.includes(:objets).all
    @donjons = Donjon.all
  end

  # GET /avatars/new
  def new
    @donjon = Donjon.new
  end

  # GET /avatars/1/edit
  def edit
  end

  # POST /avatars
  # POST /avatars.json
  def create
    @donjon = Donjon.new(donjon_params)

    respond_to do |format|
      if @donjon.save
        format.html { redirect_to @donjon, notice: 'Donjon was successfully created.' }
        format.json { render :show, status: :created, location: @donjon }
      else
        format.html { render :new }
        format.json { render json: @donjon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donjons/1
  # PATCH/PUT /donjons/1.json
  def update
    respond_to do |format|
      if @donjon.update(donjon_params)
        format.html { redirect_to @donjon, notice: 'Donjon was successfully updated.' }
        format.json { render :show, status: :ok, location: @donjon }
      else
        format.html { render :edit }
        format.json { render json: @donjon.errors, status: :unprocessable_entity }
      end
    end
  end


	private
    # Use callbacks to share common setup or constraints between actions.
    def set_donjon
      @donjon = Donjon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donjon_params
      params.require(:donjon).permit(:name, :nbMonster, :level)
    end

end
