require "application_system_test_case"

class RoleAssignmentsTest < ApplicationSystemTestCase
  setup do
    @role_assignment = role_assignments(:one)
  end

  test "visiting the index" do
    visit role_assignments_url
    assert_selector "h1", text: "Role Assignments"
  end

  test "creating a Role assignment" do
    visit role_assignments_url
    click_on "New Role Assignment"

    fill_in "Component", with: @role_assignment.component
    fill_in "Contextid", with: @role_assignment.contextid
    fill_in "Itemid", with: @role_assignment.itemid
    fill_in "Modifierid", with: @role_assignment.modifierid
    fill_in "Roleid", with: @role_assignment.roleid
    fill_in "Sortorder", with: @role_assignment.sortorder
    fill_in "Timemodified", with: @role_assignment.timemodified
    fill_in "Userid", with: @role_assignment.userid
    click_on "Create Role assignment"

    assert_text "Role assignment was successfully created"
    click_on "Back"
  end

  test "updating a Role assignment" do
    visit role_assignments_url
    click_on "Edit", match: :first

    fill_in "Component", with: @role_assignment.component
    fill_in "Contextid", with: @role_assignment.contextid
    fill_in "Itemid", with: @role_assignment.itemid
    fill_in "Modifierid", with: @role_assignment.modifierid
    fill_in "Roleid", with: @role_assignment.roleid
    fill_in "Sortorder", with: @role_assignment.sortorder
    fill_in "Timemodified", with: @role_assignment.timemodified
    fill_in "Userid", with: @role_assignment.userid
    click_on "Update Role assignment"

    assert_text "Role assignment was successfully updated"
    click_on "Back"
  end

  test "destroying a Role assignment" do
    visit role_assignments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Role assignment was successfully destroyed"
  end
end
