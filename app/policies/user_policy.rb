class UserPolicy < ApplicationPolicy
  def index?
    user && user.has_any_role?(:admin, :user_manager)
  end

  # def show?
  #   user && (user == record || user.has_any_role?(:admin, :user_manager))
  # end

  def create?
    user && user.has_any_role?(:admin, :user_manager)
  end

  def update?
    user && user.has_any_role?(:admin, :user_manager)
  end

  def destroy?
    user && (user.has_any_role? :admin, :user_manager unless user == record)
  end
end
