class LegalPolicyDocument < ApplicationRecord
	include PgSearch
    	multisearchable :against => [:title, :body]

  validates :title, :body, :effective_on, presence: true

  attachment :file

  default_scope { order('effective_on desc')}

  def self.current
    where('effective_on < ?', Date.tomorrow).order('effective_on desc').first
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
