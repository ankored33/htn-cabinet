require 'test_helper'

class CabinetsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cabinets_show_url
    assert_response :success
  end

end
