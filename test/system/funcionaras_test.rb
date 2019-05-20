require "application_system_test_case"

class FuncionarasTest < ApplicationSystemTestCase
  setup do
    @funcionara = funcionaras(:one)
  end

  test "visiting the index" do
    visit funcionaras_url
    assert_selector "h1", text: "Funcionaras"
  end

  test "creating a Funcionara" do
    visit funcionaras_url
    click_on "New Funcionara"

    fill_in "Info", with: @funcionara.info
    fill_in "Name", with: @funcionara.name
    click_on "Create Funcionara"

    assert_text "Funcionara was successfully created"
    click_on "Back"
  end

  test "updating a Funcionara" do
    visit funcionaras_url
    click_on "Edit", match: :first

    fill_in "Info", with: @funcionara.info
    fill_in "Name", with: @funcionara.name
    click_on "Update Funcionara"

    assert_text "Funcionara was successfully updated"
    click_on "Back"
  end

  test "destroying a Funcionara" do
    visit funcionaras_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Funcionara was successfully destroyed"
  end
end
