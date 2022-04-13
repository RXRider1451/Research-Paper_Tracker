require "application_system_test_case"

class PriorityListsTest < ApplicationSystemTestCase
  setup do
    @priority_list = priority_lists(:one)
  end

  test "visiting the index" do
    visit priority_lists_url
    assert_selector "h1", text: "Priority lists"
  end

  test "should create priority list" do
    visit priority_lists_url
    click_on "New priority list"

    fill_in "Priority list", with: @priority_list.priority_list
    click_on "Create Priority list"

    assert_text "Priority list was successfully created"
    click_on "Back"
  end

  test "should update Priority list" do
    visit priority_list_url(@priority_list)
    click_on "Edit this priority list", match: :first

    fill_in "Priority list", with: @priority_list.priority_list
    click_on "Update Priority list"

    assert_text "Priority list was successfully updated"
    click_on "Back"
  end

  test "should destroy Priority list" do
    visit priority_list_url(@priority_list)
    click_on "Destroy this priority list", match: :first

    assert_text "Priority list was successfully destroyed"
  end
end
