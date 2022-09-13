class MealPolicy < ApplicationPolicy

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.where(user_id: user.id) if user
    end

    private

    attr_reader :user, :scope
  end

  def show?
    scope.where(id: @record.id).exists?
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
