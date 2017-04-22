require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get logged_in" do
    get home_logged_in_url
    assert_response :success
  end

end
