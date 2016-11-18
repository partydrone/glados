class Identity < OmniAuth::Identity::Models::ActiveRecord
  validates :first_name,
            :last_name, presence: true
  validates :password,
            :password_confirmation, presence: true, on: :create
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: /\A^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$\Z/i }
end
