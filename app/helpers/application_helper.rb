module ApplicationHelper
  def full_title(page_title = nil)
    title = %w[Wavetronix]
    title << page_title if page_title.present?
    title.join(' - ')
  end
end
