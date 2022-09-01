class DietsController < PrivateApiController
  before_action :set_diet, only: %i[ destroy edit update]
  before_action :authorize_diet!


  def index
    @diets = policy_scope(Diet)
  end

  def show
    @diet = policy_scope(Diet).find(params[:id])
  end

  def new
    @diet = Diet.new(diet_params)
  end

  def create
    @diet = Diet.new(diet_params)
    calculate_diet_properties
    @diet.save
  end

  def edit
  end

  def update
    @diet.update(diet_params)
  end

  def destroy
    @diet.delete
  end

  private

  def calculate_diet_properties
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
