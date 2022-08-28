class MealsController < PrivateApiController
  before_action :find_meal, only: :update

  def search
  end

  def create
    @meal = Meal.new(meals_params)
    calculate_meal_properties
  end

  def update
  end

  private

  def find_meal
    @meal = Meal.find params[:meal_id]
  end

  def meals_params
    params.require(:meal).permit(:title, :eat_time)
  end

  def calculate_meal_properties
    data = fetch_data_from_external_api(query: params[:title])
    @meal.calories = data.delete(:calories)
    @meal.nutrients = data
  end
end
