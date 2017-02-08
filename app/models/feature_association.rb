class FeatureAssociation < ApplicationRecord
  belongs_to :feature
  belongs_to :product

  default_scope { order(:position) }
end
