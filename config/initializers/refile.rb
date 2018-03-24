require 'refile/s3'

if Rails.env.production? || Rails.env.staging?
  aws = {
    credentials: Aws::Credentials.new(Rails.application.secrets.aws_access_key_id, Rails.application.secrets.aws_secret_access_key),
    region:      Rails.application.secrets.aws_s3_region,
    bucket:      Rails.application.secrets.aws_s3_bucket
  }

  Refile.cdn_host = "//#{Rails.application.secrets.aws_cloudfront_domain}"
  Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
  Refile.store = Refile::S3.new(prefix: 'store', **aws)
end


Refile.processor :quality do |file|
  MiniMagick::Tool::Convert.new do |convert|
    convert << file.path
    convert.quality(80)
    convert << file.path
  end.call
end
