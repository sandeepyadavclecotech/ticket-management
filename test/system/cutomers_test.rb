require "application_system_test_case"

class CutomersTest < ApplicationSystemTestCase
  setup do
    @cutomer = cutomers(:one)
  end

  test "visiting the index" do
    visit cutomers_url
    assert_selector "h1", text: "Cutomers"
  end

  test "should create cutomer" do
    visit cutomers_url
    click_on "New cutomer"

    click_on "Create Cutomer"

    assert_text "Cutomer was successfully created"
    click_on "Back"
  end

  test "should update Cutomer" do
    visit cutomer_url(@cutomer)
    click_on "Edit this cutomer", match: :first

    click_on "Update Cutomer"

    assert_text "Cutomer was successfully updated"
    click_on "Back"
  end

  test "should destroy Cutomer" do
    visit cutomer_url(@cutomer)
    click_on "Destroy this cutomer", match: :first

    assert_text "Cutomer was successfully destroyed"
  end
end
