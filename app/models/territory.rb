class Territory < ApplicationRecord
	include PgSearch
  	multisearchable :against => [:name]
end
