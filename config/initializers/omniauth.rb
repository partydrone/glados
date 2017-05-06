Rails.application.config.middleware.use OmniAuth::Builder do
  ##
  # Identity
  provider :identity,
    fields: [:first_name, :last_name, :email],
    on_failed_registration: lambda { |env|
      IdentitiesController.action(:new).call(env)
    }

  ##
  # Azure AD
  provider :azure_activedirectory,
    Rails.application.secrets.azure_ad_client_id,
    Rails.application.secrets.azure_ad_tenant

  ##
  # Google
  provider :google_oauth2,
    Rails.application.secrets.google_client_id,
    Rails.application.secrets.google_client_secret,
    { name: 'google' }

  ##
  # LinkedIn
  provider :linkedin,
    Rails.application.secrets.linkedin_client_id,
    Rails.application.secrets.linkedin_client_secret,
    fields: ['id', 'first-name', 'last-name', 'email-address']
end
