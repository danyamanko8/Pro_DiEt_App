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
    @record.user_id == user.id
  end

  def create?
    user.present?
  end

  def destroy?
    @record.user_id == user.id
  end
end
