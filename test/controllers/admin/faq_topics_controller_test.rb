require 'test_helper'

class Admin::FaqTopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_faq_topics_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_faq_topics_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_faq_topics_edit_url
    assert_response :success
  end

end
