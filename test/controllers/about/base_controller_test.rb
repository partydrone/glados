require 'test_helper'

module About
  describe BaseController, :locale do
    it "gets index" do
      get about_root_path
      must_respond_with :success
    end

    it "gets news & events" do
      get about_news_events_path
      must_respond_with :success
    end
  end
end
