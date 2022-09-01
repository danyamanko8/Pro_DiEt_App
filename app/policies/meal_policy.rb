class MealPolicy < ApplicationPolicy

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.where(user_id: current_user.id) if current_user
    end

    private

    attr_reader :user, :scope
  end

  def update?
    Meal.find(params[:id]).user_id == current_user.id
  end
end
