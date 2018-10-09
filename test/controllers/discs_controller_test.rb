require 'test_helper'

class DiscsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get discs_edit_url
    assert_response :success
  end

  test "should get update" do
    get discs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get discs_destroy_url
    assert_response :success
  end

  test "should get create" do
    get discs_create_url
    assert_response :success
  end

end
