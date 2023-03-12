require "test_helper"

class Public::ShipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_ships_index_url
    assert_response :success
  end

  test "should get show" do
    get public_ships_show_url
    assert_response :success
  end
end
