module PrivateApi
  class DietsController < PrivateApiController
    include MealPropertiesParser
    before_action :set_diet, only: %i[ destroy edit update show send_report]
    before_action :authorize_diet!

    def index
      @diets = policy_scope(Diet)
    end

    def show
      @meals = current_user.meals.where(eat_time: 1.day.ago..Time.now)
    end

    def new
      @diet = Diet.new
    end

    def create
      @diet = Diet.new(diet_params)
      calculate_diet_properties
      @diet.owner_id = current_user.id
      if @diet.save
        redirect_to diet_path(@diet)
      else
        render :new
      end
    end

    def edit; end

    def update
      @diet.update(diet_params)
      calculate_diet_properties
      if @diet.save
        redirect_to diet_path(@diet)
      else
        render :edit
      end
    end

    def destroy
      @diet.delete
      redirect_to diets_path
    end

    def send_report
      SendReportJob.perform_async('user_id' => current_user.id, 'diet_id' => @diet.id)

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
