require 'test_helper'

class TrackingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tracking = trackings(:one)
  end

  test "should get index" do
    get trackings_url, as: :json
    assert_response :success
  end

  test "should create tracking" do
    assert_difference('Tracking.count') do
      post trackings_url, params: { tracking: { altitude: @tracking.altitude, float: @tracking.float, latitude: @tracking.latitude, longitude: @tracking.longitude } }, as: :json
    end

    assert_response 201
  end

  test "should show tracking" do
    get tracking_url(@tracking), as: :json
    assert_response :success
  end

  test "should update tracking" do
    patch tracking_url(@tracking), params: { tracking: { altitude: @tracking.altitude, float: @tracking.float, latitude: @tracking.latitude, longitude: @tracking.longitude } }, as: :json
    assert_response 200
  end

  test "should destroy tracking" do
    assert_difference('Tracking.count', -1) do
      delete tracking_url(@tracking), as: :json
    end

    assert_response 204
  end
end
