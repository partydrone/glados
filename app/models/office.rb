class Office < ApplicationRecord
	default_scope { order('position') }
end
