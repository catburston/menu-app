class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /recipes
  # GET /recipes.json
  def index
    params[:sort_params] = %w{recipe_category recipe_type chef}.include?(params[:sort_params]) ? params[:sort_params] : 'name'
    if !Recipe.all.empty?
      @recipes = Recipe.all.order "#{params[:sort_params]} ASC"
    else
      redirect_to new_recipe_url
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all.order("ingredients.name ASC")
    @shop_sections = Ingredient.select(:shop_section).distinct
  end

  # GET /recipes/1/edit
  def edit
    @ingredients = Ingredient.all.order("ingredients.name ASC")
    @shop_sections = Ingredient.select(:shop_section).distinct
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :recipe_category, :recipe_type, :chef, :method, :ingredient_ids => [])
    end

    # parameters to sort recipes
    def sort_params
      params.permit(:recipe_category, :recipe_type, :chef, :name, :method)
    end
end
