module PrivateApi
  class MealsController < PrivateApiController
    include MealPropertiesParser
    before_action :find_meal, only: [:update, :edit, :destroy, :show]
    before_action :authorize_meal

    def index
      @meals = policy_scope(Meal)
      @meals = @meals.where(eat_time: range_params[:from]..Time.now) if range_params[:from]
    end

    def show
      @meal = Meal.find(params[:id])
    end

    def new
      @meal = Meal.new
    end

    def create
      @meal = current_user.meals.build(meals_params)
      calculate_meal_properties
      if @meal.save
        redirect_to meal_path(@meal)
      else
        render :new
      end
    end

    def edit
    end

    def update
      @meal.update(meals_params)
      calculate_meal_properties
      if @meal.save
        redirect_to meal_path(@meal)
      else
        render :edit
      end
    end

    def destroy
      if @meal.delete
        redirect_to meals_path
      end
    end

    def range
      @meals = Meal.where(eat_time: range_params[:from]..Time.now)
    end

    private

    def range_params
      params.permit(:from)
    end

    def find_meal
      @meal = Meal.find params[:id]
    end

    def authorize_meal
      authorize(@meal || Meal)
    end

    def meals_params
      params.require(:meal).permit(:title, :eat_time)
    end

    def calculate_meal_properties
      data = fetch_meal_properties(meals_params[:title])
      @meal.calories = data.fetch(:calories)
      @meal.grams = data.fetch(:grams)
      @meal.nutrients = data.fetch(:nutrients)
    end

  end
end
