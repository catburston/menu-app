class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: [:show, :edit, :update, :destroy]

  # GET /shopping_lists
  # GET /shopping_lists.json
  def index
    if !ShoppingList.all.empty?
      @shopping_lists = ShoppingList.all
    else
      redirect_to new_menu_url
    end
  end

  # GET /shopping_lists/1
  # GET /shopping_lists/1.json
  def show
    ingredients = @shopping_list.ingredients
    @ingredient_list = ingredients.group("ingredients.name").count
    groceries = @shopping_list.groceries
    @grocery_list = groceries.group("groceries.name").count
  end

  # GET /shopping_lists/new
  def new
    @shopping_list = ShoppingList.new
    @shopping_list.name = @shopping_list.menu.name
    @groceries = Grocery.all.order("ingredients.name ASC")
  end

  # GET /shopping_lists/1/edit
  def edit
    @groceries = Grocery.all.order("ingredients.name ASC")
  end

  # POST /shopping_lists
  # POST /shopping_lists.json
  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.name = @shopping_list.menu.name

    respond_to do |format|
      if @shopping_list.save
        format.html { redirect_to @shopping_list, notice: 'Shopping list was successfully created.' }
        format.json { render :show, status: :created, location: @shopping_list }
      else
        format.html { render :new }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_lists/1
  # PATCH/PUT /shopping_lists/1.json
  def update
    respond_to do |format|
      if @shopping_list.update(shopping_list_params)
        format.html { redirect_to @shopping_list, notice: 'Shopping list was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopping_list }
      else
        format.html { render :edit }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_lists/1
  # DELETE /shopping_lists/1.json
  def destroy
    @shopping_list.destroy
    respond_to do |format|
      format.html { redirect_to shopping_lists_url, notice: 'Shopping list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_list
      @shopping_list = ShoppingList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_list_params
      params.require(:shopping_list).permit(:name, :grocery_ids => [])
    end
end
