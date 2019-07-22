require 'test_helper'

class DriversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @driver = drivers(:one)
  end

  test "should get index" do
    get drivers_url
    assert_response :success
  end

  test "should get new" do
    get new_driver_url
    assert_response :success
  end

  test "should create driver" do
    assert_difference('Driver.count') do
      post drivers_url, params: { driver: { additional_id: @driver.additional_id, address: @driver.address, city: @driver.city, conatct_2: @driver.conatct_2, contact_1: @driver.contact_1, country: @driver.country, first_name: @driver.first_name, id_proof: @driver.id_proof, last_name: @driver.last_name, profile_image: @driver.profile_image, state: @driver.state } }
    end

    assert_redirected_to driver_url(Driver.last)
  end

  test "should show driver" do
    get driver_url(@driver)
    assert_response :success
  end

  test "should get edit" do
    get edit_driver_url(@driver)
    assert_response :success
  end

  test "should update driver" do
    patch driver_url(@driver), params: { driver: { additional_id: @driver.additional_id, address: @driver.address, city: @driver.city, conatct_2: @driver.conatct_2, contact_1: @driver.contact_1, country: @driver.country, first_name: @driver.first_name, id_proof: @driver.id_proof, last_name: @driver.last_name, profile_image: @driver.profile_image, state: @driver.state } }
    assert_redirected_to driver_url(@driver)
  end

  test "should destroy driver" do
    assert_difference('Driver.count', -1) do
      delete driver_url(@driver)
    end

    assert_redirected_to drivers_url
  end
end
