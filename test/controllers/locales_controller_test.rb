require 'test_helper'

describe LocalesController, :locale do
  it "changes the locale" do
    post locales_path(locale: 'en'), params: { new_locale: 'fr-FR' }

    must_redirect_to root_path(locale: 'fr-FR')
  end
end
