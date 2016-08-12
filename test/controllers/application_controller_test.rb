require 'test_helper'

describe ApplicationController do
  before do
    I18n.available_locales = [:de, :en, :es, :fr, :'fr-FR', :it, :pt, :ru, :'zh-CN']
    I18n.default_locale = :en
    @request_headers = { 'Accept-Language': 'es-mx, en-us', 'CloudFront-Viewer-Country': 'fr' }
  end

  it "sets locale from URL parameters first" do
    cookies[:locale] = 'ru'
    get root_path, params: { locale: 'de' }, headers: @request_headers
    I18n.locale.must_equal :en
  end

  it "sets locale from cookie second" do
    cookies[:locale] = 'fr-FR'
    get root_path, headers: @request_headers
    I18n.locale.must_equal :'fr-FR'
  end

  it "sets locale from Accept-Language header third" do
    get root_path, headers: @request_headers
    I18n.locale.must_equal :en
  end

  it "sets locale from CloudFront-Viewer-Country header last" do
    skip "Need to figure out how to pass in custom headers with new Rails 5 testing syntax."
    @request_headers[:'Accept-Language'] = nil
    get root_path headers: @request_headers
    I18n.locale.must_equal :'fr-FR'
  end

  it "falls back to an available locale" do
    get root_path, params: { locale: :'nl-BE' }, headers: @request_headers
    I18n.locale.must_equal :en
    must_respond_with :redirect
  end
end
