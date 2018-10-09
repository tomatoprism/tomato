require 'test_helper'

class TracksControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tracks_create_url
    assert_response :success
  end

  test "should get update" do
    get tracks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get tracks_destroy_url
    assert_response :success
  end

end
