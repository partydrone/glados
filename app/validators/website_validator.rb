class WebsiteValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\Ahttps?:\/\/[\w\-.]+\.[a-z]+(\/.+)?\z/i
      record.errors[attribute] << (options[:message] || 'must be a valid website address (http(s)://domain.com))')
    end
  end
end
