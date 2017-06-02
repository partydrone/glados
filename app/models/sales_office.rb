class SalesOffice < ApplicationRecord
	has_many :sales_territories

	def to_param
		"#{id} #{name}".parameterize
	end
end
