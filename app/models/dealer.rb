class Dealer < ApplicationRecord
	include PgSearch
  	multisearchable :against => [:name]

	validates :name, :address, :city, :region, :zip, :phone, :email, :website, presence: true

end
