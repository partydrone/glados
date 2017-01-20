require 'test_helper'

describe Admin::BaseController, :locale do
  
  it "should get index" do
    get admin_root_path
    assert_response :success
  end

end
