require "application_system_test_case"

class PruebitaTest < ApplicationSystemTestCase
  setup do
    @pruebitum = pruebita(:one)
  end

  test "visiting the index" do
    visit pruebita_url
    assert_selector "h1", text: "Pruebita"
  end

  test "creating a Pruebitum" do
    visit pruebita_url
    click_on "New Pruebitum"

    fill_in "Age", with: @pruebitum.age
    fill_in "Info", with: @pruebitum.info
    fill_in "Name", with: @pruebitum.name
    fill_in "Salary", with: @pruebitum.salary
    click_on "Create Pruebitum"

    assert_text "Pruebitum was successfully created"
    click_on "Back"
  end

  test "updating a Pruebitum" do
    visit pruebita_url
    click_on "Edit", match: :first

    fill_in "Age", with: @pruebitum.age
    fill_in "Info", with: @pruebitum.info
    fill_in "Name", with: @pruebitum.name
    fill_in "Salary", with: @pruebitum.salary
    click_on "Update Pruebitum"

    assert_text "Pruebitum was successfully updated"
    click_on "Back"
  end

  test "destroying a Pruebitum" do
    visit pruebita_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pruebitum was successfully destroyed"
  end
end
