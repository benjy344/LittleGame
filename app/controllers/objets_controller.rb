class ObjetsController < ApplicationController
	before_action :set_objet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /objets
  # GET /objets.json
  def index
    @objets = Objet.all
  end

  # GET /objets/1
  # GET /objets/1.json
  def show
  end

  # GET /objets/new
  def new
    @objet = Objet.new
  end

  # GET /objets/1/edit
  def edit
  end

  def craftEpeeFer
    @user = current_user
    
    @avatar = @user.avatar

    @obj1 = @avatar.objets.where(name: "Baton").first.id
    @obj2 = @avatar.objets.where(name: "Fer").first.id

    @bag1 = @avatar.bags.where(objet_id: @obj1).first
    @bag2 = @avatar.bags.where(objet_id: @obj2).first(2)

    @avatar.bags.delete(@bag1, @bag2)

    
    @epee = Objet.where(name: "Épée de Fer")

    @avatar.objets << @epee

    #redirect_to Avatar.find(params[:avatar_id])

    respond_to do |format|
        format.html { Avatar.find(params[:avatar_id]) }
        format.json { render :show, status: :ok, location: @avatar }
        format.js
    end
  end

  # POST /objets
  # POST /objets.json
  def create
    @objet = Objet.new(objet_params)

    respond_to do |format|
      if @objet.save
        format.html { redirect_to @objet, notice: 'Objet was successfully created.' }
        format.json { render :show, status: :created, location: @objet }
      else
        format.html { render :new }
        format.json { render json: @objet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objets/1
  # PATCH/PUT /objets/1.json
  def update
    respond_to do |format|
      if @objet.update(objet_params)
        format.html { redirect_to @objet, notice: 'Objet was successfully updated.' }
        format.json { render :show, status: :ok, location: @objet }
      else
        format.html { render :edit }
        format.json { render json: @objet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objets/1
  # DELETE /objets/1.json
  def destroy
    @objet.destroy
    respond_to do |format|
      format.html { redirect_to objets_url, notice: 'Objet was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_objet
      @objet = Objet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objet_params
      params.require(:objet).permit(:name, :rarity, :family, :force, :agility, :magic, :description, :health, :category, :defence, :price)
    end
end
