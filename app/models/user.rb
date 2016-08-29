class User < ApplicationRecord
  include Authentication
  include Authorization

  validates :provider,
            :uid,
            :first_name,
            :last_name,
            :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
