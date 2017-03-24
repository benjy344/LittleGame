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

  def craftObjetById
    @user = current_user
    
    @avatar = @user.avatar

    # craft fer raffiné
    if params[:objet_id] == 27

      @bag1 = @avatar.bags.where(objet_id: 26).first(2)

      @avatar.bags.delete(@bag1)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end

    # craft potion soin mineur
    if params[:objet_id] == 2

      @bag1 = @avatar.bags.where(objet_id: 1).first(2)

      @avatar.bags.delete(@bag1)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end

    # craft potion soin
    if params[:objet_id] == 3

      @bag1 = @avatar.bags.where(objet_id: 1).first(3)

      @avatar.bags.delete(@bag1)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end

    # craft sève d'Yggdrasil
    if params[:objet_id] == 4

      @bag1 = @avatar.bags.where(objet_id: 2).first(2)

      @avatar.bags.delete(@bag1)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end

    # craft baton de moine
    if params[:objet_id] == 6

      @bag1 = @avatar.bags.where(objet_id: 4).first(2)

      @avatar.bags.delete(@bag1)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end

    # craft baton de sorcier
    if params[:objet_id] == 7

      @bag1 = @avatar.bags.where(objet_id: 6).first #baton de moine
      @bag2 = @avatar.bags.where(objet_id: 43).first(2) #plasma x2
      @bag3 = @avatar.bags.where(objet_id: 27).first #fer raffiné

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end

    # craft baton de feu
    if params[:objet_id] == 8

      @bag1 = @avatar.bags.where(objet_id: 7).first #baton de socier
      @bag2 = @avatar.bags.where(objet_id: 43).first(4) #plasma x4
      @bag3 = @avatar.bags.where(objet_id: 44).first(2) #pierre de feu x2

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end

    # craft baton d'eau
    if params[:objet_id] == 9

      @bag1 = @avatar.bags.where(objet_id: 7).first #baton de socier
      @bag2 = @avatar.bags.where(objet_id: 43).first(4) #plasma x4
      @bag3 = @avatar.bags.where(objet_id: 45).first(2) #pierre d'eau x2

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end

    # craft baton de terre
    if params[:objet_id] == 10

      @bag1 = @avatar.bags.where(objet_id: 7).first #baton de socier
      @bag2 = @avatar.bags.where(objet_id: 43).first(4) #plasma x4
      @bag3 = @avatar.bags.where(objet_id: 46).first(2) #pierre de terre x2

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end

    # craft baton d'ombre
    if params[:objet_id] == 47

      @bag1 = @avatar.bags.where(objet_id: 7).first #baton de socier
      @bag2 = @avatar.bags.where(objet_id: 43).first(4) #plasma x4
      @bag3 = @avatar.bags.where(objet_id: 49).first(2) #pierre d'ombre x2

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end

    # craft baton de lumiere
    if params[:objet_id] == 48

      @bag1 = @avatar.bags.where(objet_id: 7).first #baton de socier
      @bag2 = @avatar.bags.where(objet_id: 43).first(4) #plasma x4
      @bag3 = @avatar.bags.where(objet_id: 50).first(2) #pierre de lumiere x2

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end

    # craft baton d'Yggdrasil'
    if params[:objet_id] == 11

      @bag1 = @avatar.bags.where(objet_id: 8).first #baton de feu
      @bag2 = @avatar.bags.where(objet_id: 9).first #baton de eau
      @bag3 = @avatar.bags.where(objet_id: 10).first #baton de terre
      @bag4 = @avatar.bags.where(objet_id: 47).first #baton de ombre
      @bag5 = @avatar.bags.where(objet_id: 48).first #baton de lumiere
      @bag6 = @avatar.bags.where(objet_id: 4).first(5) #seve x5

      @avatar.bags.delete(@bag1, @bag2, @bag3, @bag4, @bag5, @bag6)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end


    # craft épée de fer
    if params[:objet_id] == 12
      @bag1 = @avatar.bags.where(objet_id: 5).first #baton
      @bag2 = @avatar.bags.where(objet_id: 27).first(2) #fer x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end

    # craft épée dacier
    if params[:objet_id] == 13
      @bag1 = @avatar.bags.where(objet_id: 12).first #epee de fer
      @bag2 = @avatar.bags.where(objet_id: 28).first(2) #acier x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(id: params[:objet_id])
      @avatar.objets << @craft
    end
    


    respond_to do |format|
        format.html { redirect_to :back }
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
