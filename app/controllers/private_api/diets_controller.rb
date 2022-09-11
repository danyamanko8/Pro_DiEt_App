module PrivateApi
  class DietsController < PrivateApiController
    include MealPropertiesParser

    before_action :set_diet, only: %i[ destroy edit update]
    before_action :authorize_diet!


    def index
      @diets = policy_scope(Diet)
    end

    def show
      @diet = Diet.find(params[:id])
    end

    def new
      @diet = Diet.new
    end

    def create
      @diet = Diet.new(diet_params)
      calculate_diet_properties
      @diet.owner_id = current_user.id
      @diet.save

      redirect_to diet_path(@diet)
    end

    def edit
    end

    def update
      @diet.update(diet_params)
      calculate_diet_properties
      @diet.save

      redirect_to @diet
    end

    def destroy
      @diet.delete

      redirect_to diets_path
    end

    private

    def calculate_diet_properties
      data = fetch_meal_properties(diet_params[:components])
      @diet.total_calories = data.fetch(:calories)
      @diet.nutrients = data.fetch(:nutrients)
    end

    def diet_params
      params.require(:diet).permit(:name, :components, :description)
    end

    def set_diet
      @diet = Diet.find(params[:id])
    end

    def authorize_diet!
      authorize(@diet || Diet)
    end
  end
end
