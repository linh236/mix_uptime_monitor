require "test_helper"

class PingControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ping_create_url
    assert_response :success
  end
end
