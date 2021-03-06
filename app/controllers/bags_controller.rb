class BagsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /bags
  # GET /bags.json
  def index
    @bags = Bag.includes(:avatar, :objet).all
  end

  # GET /bags/1
  # GET /bags/1.json
  def show
  end

  # GET /bags/new
  def new
    @bag = Bag.new
  end

  # GET /bags/1/edit
  def edit
  end

  # POST /bags
  # POST /bags.json
  def create
  	puts bag_params
  	
    #@bag = Bag.new(bag_params)
    #redirect_to @avatar
    # respond_to do |format|
    #   if @bag.save
    #     format.html { redirect_to @avatar, notice: 'bag was successfully created.' }
    #     format.json { render :show, status: :created, location: @avatae }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @avatar.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /bags/1
  # PATCH/PUT /bags/1.json
  def update
    respond_to do |format|
      if @bag.update(bag_params)
        format.html { redirect_to @bag, notice: 'bag was successfully updated.' }
        format.json { render :show, status: :ok, location: @bag }
      else
        format.html { render :edit }
        format.json { render json: @bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bags/1
  # DELETE /bags/1.json
  def destroy
    @bag.destroy
    respond_to do |format|
      format.html { redirect_to bags_url, notice: 'bag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroyByAvatarIdAndObjetId(avatar_id, objet_id)
  	@bags = Bags.all
  	@bag = @bags.where(avatar_id: avatar_id, objet_id: objet_id).first

    @bag.destroy

    respond_to do |format|
      format.html { redirect_to bags_url, notice: 'bag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bag
      @bag = Bag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bag_params
      params.require(:bag).permit(:avatar_id, :objet_id)
    end
end
