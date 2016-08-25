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
          user.first_name = auth['first_name']
          user.last_name  = auth['last_name']
          user.email      = auth['email']
        end
      end
    end
  end
end
