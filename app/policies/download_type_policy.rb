class DownloadTypePolicy < ApplicationPolicy
  def index?
    user && user.has_any_role?(:admin, :download_type_manager)
  end

  # def show?
  #   user && user.has_any_role?(:admin, :download_type_manager)
  # end

  def create?
    user && user.has_any_role?(:admin, :download_type_manager)
  end

  def update?
    user && user.has_any_role?(:admin, :download_type_manager)
  end

  def destroy?
    user && user.has_any_role?(:admin, :download_type_manager)
  end
end
