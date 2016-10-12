require "shrine/storage/s3"

s3_options = {
  access_key_id:     Rails.application.secrets.aws_access_key_id,
  secret_access_key: Rails.application.secrets.aws_secret_access_key,
  region:            Rails.application.secrets.aws_s3_region,
  bucket:            Rails.application.secrets.aws_s3_bucket
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", upload_options: {acl: "public-read"}, **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", upload_options: {acl: "public-read"}, **s3_options)
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :direct_upload
