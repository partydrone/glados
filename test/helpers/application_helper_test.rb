require 'test_helper'

describe ApplicationHelper do
  describe "#full_title" do
    it "formats a title without an argument" do
      full_title.must_equal 'Wavetronix'
    end

    it "formats a title with an empty argument" do
      full_title('').must_equal 'Wavetronix'
    end

    it "formats a title with an argument" do
      full_title('SmartSensor HD').must_equal 'Wavetronix - SmartSensor HD'
    end
  end

  describe "#humanize_locale" do
    it "expands a simple locale into a readable string" do
      I18n.locale = :en
      humanize_locale(:de).must_equal 'German'
    end

    it "expands a compound locale into a readable string" do
      I18n.locale = :en
      humanize_locale(:'zh-CN').must_equal 'Chinese (China)'
    end
  end

  describe "#set_class_for_content_type" do
    it "converts content type into CSS class" do
      set_class_for_content_type('application/pdf').must_equal 'application-pdf'
      set_class_for_content_type('image/jpeg').must_equal 'image-jpeg'
    end
  end

  describe "#country_from" do
    it "returns the country code for a locale with a country" do
      locale = :'en-US'
      country_from(locale).must_equal 'US'
    end

    it "returns nil for locale without a country" do
      locale = :en
      country_from(locale).must_be_nil
    end
  end
end
