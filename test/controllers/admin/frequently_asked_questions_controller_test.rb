require 'test_helper'

class Admin::FrequentlyAskedQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_frequently_asked_questions_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_frequently_asked_questions_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_frequently_asked_questions_edit_url
    assert_response :success
  end

end
