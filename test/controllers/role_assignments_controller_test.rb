require 'test_helper'

class RoleAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role_assignment = role_assignments(:one)
  end

  test "should get index" do
    get role_assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_role_assignment_url
    assert_response :success
  end

  test "should create role_assignment" do
    assert_difference('RoleAssignment.count') do
      post role_assignments_url, params: { role_assignment: { component: @role_assignment.component, contextid: @role_assignment.contextid, itemid: @role_assignment.itemid, modifierid: @role_assignment.modifierid, roleid: @role_assignment.roleid, sortorder: @role_assignment.sortorder, timemodified: @role_assignment.timemodified, userid: @role_assignment.userid } }
    end

    assert_redirected_to role_assignment_url(RoleAssignment.last)
  end

  test "should show role_assignment" do
    get role_assignment_url(@role_assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_role_assignment_url(@role_assignment)
    assert_response :success
  end

  test "should update role_assignment" do
    patch role_assignment_url(@role_assignment), params: { role_assignment: { component: @role_assignment.component, contextid: @role_assignment.contextid, itemid: @role_assignment.itemid, modifierid: @role_assignment.modifierid, roleid: @role_assignment.roleid, sortorder: @role_assignment.sortorder, timemodified: @role_assignment.timemodified, userid: @role_assignment.userid } }
    assert_redirected_to role_assignment_url(@role_assignment)
  end

  test "should destroy role_assignment" do
    assert_difference('RoleAssignment.count', -1) do
      delete role_assignment_url(@role_assignment)
    end

    assert_redirected_to role_assignments_url
  end
end
