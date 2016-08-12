require 'test_helper'

describe ApplicationHelper do
  describe "full_title" do
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
end
