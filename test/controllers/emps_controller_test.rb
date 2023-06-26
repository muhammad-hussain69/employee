require "test_helper"

class EmpsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get emps_index_url
    assert_response :success
  end

  test "should get new" do
    get emps_create_url
    assert_response :success
  end
end
