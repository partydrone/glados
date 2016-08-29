class User < ApplicationRecord
  module Authorization
    extend ActiveSupport::Concern

    included do
      rolify
    end
  end
end
