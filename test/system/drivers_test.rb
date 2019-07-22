require "application_system_test_case"

class DriversTest < ApplicationSystemTestCase
  setup do
    @driver = drivers(:one)
  end

  test "visiting the index" do
    visit drivers_url
    assert_selector "h1", text: "Drivers"
  end

  test "creating a Driver" do
    visit drivers_url
    click_on "New Driver"

    fill_in "Additional", with: @driver.additional_id
    fill_in "Address", with: @driver.address
    fill_in "City", with: @driver.city
    fill_in "Conatct 2", with: @driver.conatct_2
    fill_in "Contact 1", with: @driver.contact_1
    fill_in "Country", with: @driver.country
    fill_in "First name", with: @driver.first_name
    fill_in "Id proof", with: @driver.id_proof
    fill_in "Last name", with: @driver.last_name
    fill_in "Profile image", with: @driver.profile_image
    fill_in "State", with: @driver.state
    click_on "Create Driver"

    assert_text "Driver was successfully created"
    click_on "Back"
  end

  test "updating a Driver" do
    visit drivers_url
    click_on "Edit", match: :first

    fill_in "Additional", with: @driver.additional_id
    fill_in "Address", with: @driver.address
    fill_in "City", with: @driver.city
    fill_in "Conatct 2", with: @driver.conatct_2
    fill_in "Contact 1", with: @driver.contact_1
    fill_in "Country", with: @driver.country
    fill_in "First name", with: @driver.first_name
    fill_in "Id proof", with: @driver.id_proof
    fill_in "Last name", with: @driver.last_name
    fill_in "Profile image", with: @driver.profile_image
    fill_in "State", with: @driver.state
    click_on "Update Driver"

    assert_text "Driver was successfully updated"
    click_on "Back"
  end

  test "destroying a Driver" do
    visit drivers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Driver was successfully destroyed"
  end
end
