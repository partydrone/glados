class Dealer < ApplicationRecord
	include PgSearch
	multisearchable against: [:name, :region, :country_id, :country_name]

	has_many :sales_territories

	validates :name, :address, :country_id, presence: true
	validate :has_locality_region_or_postal_code
	validates :email, email: true, allow_blank: true
  validates :website, website: true, allow_blank: true

	def country_name
		COUNTRIES[country_id.to_sym]
	end

	private

  def has_locality_region_or_postal_code
    if locality.blank? && region.blank? && postal_code.blank?
      errors.add :locality, 'requires a locality, region or postal code'
    end
  end
end
