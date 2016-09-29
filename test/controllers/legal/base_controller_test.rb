require 'test_helper'

module Legal
  describe BaseController, :locale do
    it "gets index" do
      get legal_root_path
      must_respond_with :success
    end
  end
end
