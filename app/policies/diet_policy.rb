class DietPolicy < ApplicationPolicy

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      default_diets = scope.without_owner
      default_diets.merge.where(owner_id: user.id) if user
    end

    private

    attr_reader :user, :scope
  end

  def update?
    user_owner?
  end

  def create?
    user.present?
  end

  def destroy?
    user_owner?
  end

  private

  def user_owner?
    @diet.owner_id == user.id
  end

end
