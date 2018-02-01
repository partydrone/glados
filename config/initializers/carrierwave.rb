# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     provider:              'AWS',                                           # required
#     aws_access_key_id:     Rails.application.secrets.aws_access_key_id,     # required
#     aws_secret_access_key: Rails.application.secrets.aws_secret_access_key, # required
#     region:                'us-east-1'                                      # optional, defaults to 'us-east-1'
#   }
#   config.fog_directory = 'com-wavetronix-staging-glados-uploads' if Rails.env.staging? # required
#   config.fog_directory = 'com-wavetronix-www-uploads' if Rails.env.production?         # required
#   # see https://github.com/jnicklas/carrierwave#using-amazon-s3
#   # for more optional configuration
# end
