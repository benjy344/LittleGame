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

    @idcraft = params[:objet_id].to_i


    # craft fer raffiné
    if @idcraft == 27

      @bag1 = @avatar.bags.where(objet_id: 26).first(2)

      @avatar.bags.delete(@bag1)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft acier raffiné
    if @idcraft == 29

      @bag1 = @avatar.bags.where(objet_id: 28).first(2)

      @avatar.bags.delete(@bag1)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft or raffiné
    if @idcraft == 31

      @bag1 = @avatar.bags.where(objet_id: 30).first(2)

      @avatar.bags.delete(@bag1)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft potion soin mineur
    if @idcraft == 2

      @bag1 = @avatar.bags.where(objet_id: 1).first(2)

      @avatar.bags.delete(@bag1)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft potion soin
    if @idcraft == 3

      @bag1 = @avatar.bags.where(objet_id: 1).first(3)

      @avatar.bags.delete(@bag1)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft sève d'Yggdrasil
    if @idcraft == 4

      @bag1 = @avatar.bags.where(objet_id: 2).first(2)

      @avatar.bags.delete(@bag1)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft baton de moine
    if @idcraft == 6
      @bag1 = @avatar.bags.where(objet_id: 5).first(2)

      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft baton de sorcier
    if @idcraft == 7

      @bag1 = @avatar.bags.where(objet_id: 6).first #baton de moine
      @bag2 = @avatar.bags.where(objet_id: 43).first(2) #plasma x2
      @bag3 = @avatar.bags.where(objet_id: 27).first #fer raffiné

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft baton de feu
    if @idcraft == 8

      @bag1 = @avatar.bags.where(objet_id: 7).first #baton de socier
      @bag2 = @avatar.bags.where(objet_id: 43).first(4) #plasma x4
      @bag3 = @avatar.bags.where(objet_id: 44).first(2) #pierre de feu x2

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft baton d'eau
    if @idcraft == 9

      @bag1 = @avatar.bags.where(objet_id: 7).first #baton de socier
      @bag2 = @avatar.bags.where(objet_id: 43).first(4) #plasma x4
      @bag3 = @avatar.bags.where(objet_id: 45).first(2) #pierre d'eau x2

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft baton de terre
    if @idcraft == 10

      @bag1 = @avatar.bags.where(objet_id: 7).first #baton de socier
      @bag2 = @avatar.bags.where(objet_id: 43).first(4) #plasma x4
      @bag3 = @avatar.bags.where(objet_id: 46).first(2) #pierre de terre x2

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft baton d'ombre
    if @idcraft == 47

      @bag1 = @avatar.bags.where(objet_id: 7).first #baton de socier
      @bag2 = @avatar.bags.where(objet_id: 43).first(4) #plasma x4
      @bag3 = @avatar.bags.where(objet_id: 49).first(2) #pierre d'ombre x2

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft baton de lumiere
    if @idcraft == 48

      @bag1 = @avatar.bags.where(objet_id: 7).first #baton de socier
      @bag2 = @avatar.bags.where(objet_id: 43).first(4) #plasma x4
      @bag3 = @avatar.bags.where(objet_id: 50).first(2) #pierre de lumiere x2

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft baton d'Yggdrasil
    if @idcraft == 11

      @bag1 = @avatar.bags.where(objet_id: 8).first #baton de feu
      @bag2 = @avatar.bags.where(objet_id: 9).first #baton de eau
      @bag3 = @avatar.bags.where(objet_id: 10).first #baton de terre
      @bag4 = @avatar.bags.where(objet_id: 47).first #baton de ombre
      @bag5 = @avatar.bags.where(objet_id: 48).first #baton de lumiere
      @bag6 = @avatar.bags.where(objet_id: 4).first(5) #seve x5

      @avatar.bags.delete(@bag1, @bag2, @bag3, @bag4, @bag5, @bag6)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft épée de fer
    if @idcraft == 12
      @bag1 = @avatar.bags.where(objet_id: 5).first #baton
      @bag2 = @avatar.bags.where(objet_id: 26).first(2) #fer x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end
    # craft épée de fer raffiné
    if @idcraft == 51
      @bag1 = @avatar.bags.where(objet_id: 5).first #baton
      @bag2 = @avatar.bags.where(objet_id: 27).first(2) #fer rafiné x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft épée dacier
    if @idcraft == 13
      @bag1 = @avatar.bags.where(objet_id: 12).first #epee de fer
      @bag2 = @avatar.bags.where(objet_id: 28).first(2) #acier x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft épée dacier raffiné
    if @idcraft == 52
      @bag1 = @avatar.bags.where(objet_id: 12).first #epee de fer
      @bag2 = @avatar.bags.where(objet_id: 29).first(2) #acier raffiné x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft épée dor
    if @idcraft == 14
      @bag1 = @avatar.bags.where(objet_id: 13).first #epee d'acier
      @bag2 = @avatar.bags.where(objet_id: 30).first(2) #or x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft épée dor raffiné
    if @idcraft == 53
      @bag1 = @avatar.bags.where(objet_id: 13).first #epee d'acier
      @bag2 = @avatar.bags.where(objet_id: 31).first(2) #or raffiné x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft katana
    if @idcraft == 15
      @bag1 = @avatar.bags.where(objet_id: 52).first #epee d'acier rafiné
      @bag2 = @avatar.bags.where(objet_id: 31).first #or raffiné 
      @bag3 = @avatar.bags.where(objet_id: 43).first #plasma

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft katana Amakuni
    if @idcraft == 16
      @bag1 = @avatar.bags.where(objet_id: 14).first #epee d'or
      @bag2 = @avatar.bags.where(objet_id: 31).first #or raffiné 
      @bag3 = @avatar.bags.where(objet_id: 43).first(2) #plasma x2

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft hache de ragnar
    if @idcraft == 18
      @bag1 = @avatar.bags.where(objet_id: 6).first #baton de moine
      @bag2 = @avatar.bags.where(objet_id: 27).first(2) #fer raffine x2
      @bag3 = @avatar.bags.where(objet_id: 29).first(2) #acier raffiné x2

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft dague de fer
    if @idcraft == 19
      @bag1 = @avatar.bags.where(objet_id: 5).first #baton
      @bag2 = @avatar.bags.where(objet_id: 26).first(2) #fer x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft dague dacier
    if @idcraft == 20
      @bag1 = @avatar.bags.where(objet_id: 19).first #dague de fer
      @bag2 = @avatar.bags.where(objet_id: 28).first(2) #acier x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft dague du voleur
    if @idcraft == 22
      @bag1 = @avatar.bags.where(objet_id: 20).first #dague d'acier
      @bag2 = @avatar.bags.where(objet_id: 30).first(2) #or x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft dague empoisonnée
    if @idcraft == 21
      @bag1 = @avatar.bags.where(objet_id: 22).first #dague du voleur
      @bag2 = @avatar.bags.where(objet_id: 31).first #or raffiné 
      @bag3 = @avatar.bags.where(objet_id: 4).first #seve

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft Assassine
    if @idcraft == 23
      @bag1 = @avatar.bags.where(objet_id: 21).first #dague empoisonée
      @bag2 = @avatar.bags.where(objet_id: 31).first #tissu de la faucheuse
      @bag3 = @avatar.bags.where(objet_id: 43).first(3) #plasma x3

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft bouclier de bois
    if @idcraft == 32
      @bag1 = @avatar.bags.where(objet_id: 5).first(4) #baton x4
      @bag2 = @avatar.bags.where(objet_id: 25).first #cuire

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft bouclier de fer
    if @idcraft == 33
      @bag1 = @avatar.bags.where(objet_id: 32).first #bouclier de bois
      @bag2 = @avatar.bags.where(objet_id: 26).first(2) #fer x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft bouclier d'acier
    if @idcraft == 34
      @bag1 = @avatar.bags.where(objet_id: 33).first #bouclier de fer 
      @bag2 = @avatar.bags.where(objet_id: 28).first(2) #acier x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft bouclier d'or
    if @idcraft == 35
      @bag1 = @avatar.bags.where(objet_id: 34).first #bouclier de acier 
      @bag2 = @avatar.bags.where(objet_id: 30).first(2) #or x2

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft yata no kagami
    if @idcraft == 36
      @bag1 = @avatar.bags.where(objet_id: 35).first #bouclier d or 
      @bag2 = @avatar.bags.where(objet_id: 55).first #miroir du lac 
      @bag3 = @avatar.bags.where(objet_id: 31).first(3) #or raffiné x3

      @avatar.bags.delete(@bag1, @bag2, @bag3)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft armure peaux
    if @idcraft == 36
      @bag1 = @avatar.bags.where(objet_id: 24).first(3) #peau x3 

      @avatar.bags.delete(@bag1)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft armure cuire
    if @idcraft == 38
      @bag1 = @avatar.bags.where(objet_id: 25).first(3) #cuire x3 

      @avatar.bags.delete(@bag1)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft armure ecailles
    if @idcraft == 40
      @bag1 = @avatar.bags.where(objet_id: 39).first(2) #ecaille x2 
      @bag2 = @avatar.bags.where(objet_id: 38).first #armure de cuire 

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end

    # craft armure fer
    if @idcraft == 41
      @bag1 = @avatar.bags.where(objet_id: 26).first(2) #fer x2 
      @bag2 = @avatar.bags.where(objet_id: 27).first(2) #fer x2 

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
      @avatar.objets << @craft
    end


    # craft armure Deidra
    if @idcraft == 42
      @bag1 = @avatar.bags.where(objet_id: 41).first #armure fer  
      @bag2 = @avatar.bags.where(objet_id: 56).first #coeur 
      @bag2 = @avatar.bags.where(objet_id: 31).first(3) #or raff x3 

      @avatar.bags.delete(@bag1, @bag2)
      @craft = Objet.find(@idcraft)
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
