require 'test_helper'

module Support
  describe BaseController, :locale do
    it "gets index" do
      get support_root_path
      must_respond_with :success
    end
  end
end
