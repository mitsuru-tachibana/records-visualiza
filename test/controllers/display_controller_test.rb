require "test_helper"

class DisplayControllerTest < ActionDispatch::IntegrationTest
  test "should get visualize" do
    get display_visualize_url
    assert_response :success
  end

  test "should get compare" do
    get display_compare_url
    assert_response :success
  end
end
