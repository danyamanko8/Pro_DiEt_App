class DietPolicy < ApplicationPolicy
  class Scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      default_diets = scope.without_owner
      default_diets.or(scope.where(owner_id: user.id)) if user
    end

    private

    attr_reader :user, :scope
  end

  def show?
    scope.where(id: @record.id).exists?
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

  def send_report?
    show?
  end

  private

  def user_owner?
    @record.owner_id == user.id
  end
end
