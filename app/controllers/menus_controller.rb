class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all.reverse_order
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    ingredients = @menu.ingredients
    @ingredient_list = ingredients.order("ingredients.shop_section").group("ingredients.shop_section, ingredients.name").count
  end

  # GET /menus/new
  def new
    @menu = Menu.new
    @recipes = Recipe.all.order("recipes.name ASC")
    @date = Date.commercial(Date.today.year, 1+Date.today.cweek, 1).strftime("%d %b, %Y")
  end

  # GET /menus/1/edit
  def edit
    @recipes = Recipe.all.all.order("recipes.name ASC")
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        # @menu.create_shopping_list
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:name, :recipe_ids => [])
    end

    #params to show only certain store sections
    def show_params
      params.permit(:dairy, :nuts, :bread, :fruit_veg, :tinned_goods, :cleaning, :market, :frozen, :deli, :snacks, :baking)
    end
end
