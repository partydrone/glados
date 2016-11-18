class LegalPolicyDocument < ApplicationRecord
  include AttachmentUploader[:attachment]

  validates :title, :body, :effective_on, presence: true

  default_scope { order('effective_on desc')}

  def self.current
    where('effective_on < ?', Date.tomorrow).order('effective_on desc').first
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
