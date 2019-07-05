require 'test_helper'

class CarriersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carrier = carriers(:one)
  end

  test "should get index" do
    get carriers_url, as: :json
    assert_response :success
  end

  test "should create carrier" do
    assert_difference('Carrier.count') do
      post carriers_url, params: { carrier: { age: @carrier.age, has_driver_licence_a: @carrier.has_driver_licence_a, has_driver_licence_b: @carrier.has_driver_licence_b, has_driver_licence_c: @carrier.has_driver_licence_c, name: @carrier.name } }, as: :json
    end

    assert_response 201
  end

  test "should show carrier" do
    get carrier_url(@carrier), as: :json
    assert_response :success
  end

  test "should update carrier" do
    patch carrier_url(@carrier), params: { carrier: { age: @carrier.age, has_driver_licence_a: @carrier.has_driver_licence_a, has_driver_licence_b: @carrier.has_driver_licence_b, has_driver_licence_c: @carrier.has_driver_licence_c, name: @carrier.name } }, as: :json
    assert_response 200
  end

  test "should destroy carrier" do
    assert_difference('Carrier.count', -1) do
      delete carrier_url(@carrier), as: :json
    end

    assert_response 204
  end
end
