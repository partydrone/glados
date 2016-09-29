class UserPolicy < ApplicationPolicy
  def index?
    user && user.has_role?(:admin)
  end

  def show?
    user && (user == record || user.has_role?(:admin))
  end

  def create?
    user && user.has_role?(:admin)
  end

  def update?
    user && user.has_role?(:admin)
  end

  def destroy?
    user && (user.has_role? :admin unless user == record)
  end
end
