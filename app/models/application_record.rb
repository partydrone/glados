class ApplicationRecord < ActiveRecord::Base
  extend Mobility

  self.abstract_class = true

  def cache_key(*timestamp_names)
    if new_record?
      "#{I18n.locale}/#{model_name.cache_key}/new"
    else
      timestamp = if timestamp_names.any?
        max_updated_column_timestamp(timestamp_names)
      else
        max_updated_column_timestamp
      end

      if timestamp
        timestamp = timestamp.utc.to_s(cache_timestamp_format)
        "#{I18n.locale}/#{model_name.cache_key}/#{id}-#{timestamp}"
      else
        "#{I18n.locale}/#{model_name.cache_key}/#{id}"
      end
    end
  end
end
