Rails.application.config.middleware.use OmniAuth::Builder do
  ##
  # Identity
  provider :identity,
    fields: [:first_name, :last_name, :email],
    on_failed_registration: lambda { |env|
      IdentitiesController.action(:new).call(env)
    }

  ##
  # ADFS
  provider :wsfed,
    issuer_name:          'http://adfs.wavetronix.com/adfs/services/trust',
    issuer:               'https://adfs.wavetronix.com/adfs/ls/',
    realm:                'https://www.wavetronix.com',
    reply:                'https://www.wavetronix.com/auth/wsfed/callback',
    saml_version:         '1',
    id_claim:             'upn',
    idp_cert_fingerprint: '…'

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
