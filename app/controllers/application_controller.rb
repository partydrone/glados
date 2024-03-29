class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Pundit

  before_action :set_locale

  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def permission_denied
    if current_user
      flash[:alert] = "You tried to access something you're not authorized to."
      redirect_back fallback_location: root_path
    else
      store_location
      redirect_to sign_in_path
    end
  end

  private

  def authenticate!
    unless current_user
      store_location
      redirect_to sign_in_path
    end
  end
  helper_method :authenticate!

  def current_locale_with_fallback
    I18n.locale =~ /^(([a-z]{2,2})(?:[-|_]([A-Z]{2,2}))?)$/i
    locales = []
    locales << $2
    locales << $1 unless $1 == $2
    return locales
  end
  helper_method :current_locale_with_fallback
  
  def current_user
    @current_user ||= User.find_by(auth_token: cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].try do
      scan(/(?:[a-z]{2,2})(?:[-|_](?:[A-Z]{2,2}))?/i).first do |str|
        str.gsub!(/([a-z]{2,2})(?:[-|_]([A-Z]{2,2}))?/i) { |s| $2 ? "#{$1}-#{$2.upcase}" : $1 }
      end
    end
  end

  def set_locale
    locale = params[:locale] ||
             cookies[:locale] ||
             extract_locale_from_accept_language_header ||
             set_locale_from_cloudfront_viewer_country ||
             I18n.default_locale

    locale = locale.to_sym

    I18n.fallbacks[locale].each do |l|
      if l.in? [:en, :'fr-FR']
        locale = l
        break
      end
    end

    I18n.locale = locale

    unless request.fullpath =~ /^\/(#{I18n.available_locales.join('|')})/
      url = request.protocol
      url += request.host
      url += ":#{request.port}" unless request.port.in? [80, 443]
      url += "/#{I18n.locale}"
      url += request.fullpath unless request.fullpath == '/'
      redirect_to url, status: :found
    end
  end

  def set_locale_from_cloudfront_viewer_country
    case request.env['HTTP_CLOUDFRONT_VIEWER_COUNTRY'].try(:upcase)
    when 'FR'
      return :'fr-FR'
    else
      return I18n.default_locale
    end
  end

  def store_location
    session[:referer] = request.fullpath
  end
end
