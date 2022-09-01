class MealsController < PrivateApiController
  before_action :find_meal, only: [:update, :edit, :destroy]
  before_action :authorize_meal

  def index
    @meals = policy_scope(Meal)
  end

  def show
    @meal = policy_scope(Meal).find(params[:id])
  end

  def new
    @meal = Meal.new(meal_params)
  end

  def create
    @meal = Meal.new(meals_params)
    calculate_meal_properties
    @meal.save
  end

  def edit
  end

  def update
    @meal.update(meals_params)
  end

  def destroy
    @meal.delete
  end

  private

  def find_meal
    @meal = Meal.find params[:meal_id]
  end

  def authorize_meal
    authorize(@meal || Meal)
  end

  def meals_params
    params.require(:meal).permit(:title, :eat_time)
  end

  def calculate_meal_properties
    data = Calorieninjas::Client.new(query: params[:title]).get
    @meal.calories = data.delete(:calories)
    @meal.nutrients = data
  end

end
