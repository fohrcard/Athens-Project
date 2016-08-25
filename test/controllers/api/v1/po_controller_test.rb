require 'test_helper'

class Api::V1::PoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get po_index_url
    assert_response :success
  end

end
