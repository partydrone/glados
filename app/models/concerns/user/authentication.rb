class User < ApplicationRecord
  module Authentication
    extend ActiveSupport::Concern

    included do
      has_secure_token :auth_token
    end

    module ClassMethods
      def from_omniauth(auth)
        find_by(provider: auth['provider'], uid: auth['uid']) || create_with_omniauth(auth)
      end

      def create_with_omniauth(auth)
        create! do |user|
          user.provider   = auth['provider']
          user.uid        = auth['uid']
          user.first_name = auth['info']['first_name']
          user.last_name  = auth['info']['last_name']
          user.email      = auth['info']['email']
        end
      end
    end
  end
end
