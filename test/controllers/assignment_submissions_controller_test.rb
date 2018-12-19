require 'test_helper'

class AssignmentSubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignment_submission = assignment_submissions(:one)
  end

  test "should get index" do
    get assignment_submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_assignment_submission_url
    assert_response :success
  end

  test "should create assignment_submission" do
    assert_difference('AssignmentSubmission.count') do
      post assignment_submissions_url, params: { assignment_submission: { assignment: @assignment_submission.assignment, data1: @assignment_submission.data1, data2: @assignment_submission.data2, format: @assignment_submission.format, grade: @assignment_submission.grade, mailed: @assignment_submission.mailed, numfiles: @assignment_submission.numfiles, submissioncomment: @assignment_submission.submissioncomment, teacher: @assignment_submission.teacher, timecreated: @assignment_submission.timecreated, timemarked: @assignment_submission.timemarked, timemodified: @assignment_submission.timemodified, userid: @assignment_submission.userid } }
    end

    assert_redirected_to assignment_submission_url(AssignmentSubmission.last)
  end

  test "should show assignment_submission" do
    get assignment_submission_url(@assignment_submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignment_submission_url(@assignment_submission)
    assert_response :success
  end

  test "should update assignment_submission" do
    patch assignment_submission_url(@assignment_submission), params: { assignment_submission: { assignment: @assignment_submission.assignment, data1: @assignment_submission.data1, data2: @assignment_submission.data2, format: @assignment_submission.format, grade: @assignment_submission.grade, mailed: @assignment_submission.mailed, numfiles: @assignment_submission.numfiles, submissioncomment: @assignment_submission.submissioncomment, teacher: @assignment_submission.teacher, timecreated: @assignment_submission.timecreated, timemarked: @assignment_submission.timemarked, timemodified: @assignment_submission.timemodified, userid: @assignment_submission.userid } }
    assert_redirected_to assignment_submission_url(@assignment_submission)
  end

  test "should destroy assignment_submission" do
    assert_difference('AssignmentSubmission.count', -1) do
      delete assignment_submission_url(@assignment_submission)
    end

    assert_redirected_to assignment_submissions_url
  end
end
