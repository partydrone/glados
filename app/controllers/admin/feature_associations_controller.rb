module Admin
  class FeatureAssociationsController < BaseController
    def sort
      params[:feature_association].each_with_index do |id, index|
        FeatureAssociation.where(id: id).update_all({position: index + 1})
      end
      head :no_content
    end
  end
end
