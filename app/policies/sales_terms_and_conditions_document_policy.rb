class SalesTermsAndConditionsDocumentPolicy < ApplicationPolicy
  def index?
    user && user.has_any_role?(:admin, :sales_terms_and_conditions_document_manager)
  end

  def show?
    user && user.has_any_role?(:admin, :sales_terms_and_conditions_document_manager)
  end

  def create?
    user && user.has_any_role?(:admin, :sales_terms_and_conditions_document_manager)
  end

  def update?
    user && user.has_any_role?(:admin, :sales_terms_and_conditions_document_manager)
  end

  def destroy?
    user && user.has_any_role?(:admin, :sales_terms_and_conditions_document_manager)
  end
end
