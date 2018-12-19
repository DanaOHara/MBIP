require "application_system_test_case"

class AssignmentSubmissionsTest < ApplicationSystemTestCase
  setup do
    @assignment_submission = assignment_submissions(:one)
  end

  test "visiting the index" do
    visit assignment_submissions_url
    assert_selector "h1", text: "Assignment Submissions"
  end

  test "creating a Assignment submission" do
    visit assignment_submissions_url
    click_on "New Assignment Submission"

    fill_in "Assignment", with: @assignment_submission.assignment
    fill_in "Data1", with: @assignment_submission.data1
    fill_in "Data2", with: @assignment_submission.data2
    fill_in "Format", with: @assignment_submission.format
    fill_in "Grade", with: @assignment_submission.grade
    fill_in "Mailed", with: @assignment_submission.mailed
    fill_in "Numfiles", with: @assignment_submission.numfiles
    fill_in "Submissioncomment", with: @assignment_submission.submissioncomment
    fill_in "Teacher", with: @assignment_submission.teacher
    fill_in "Timecreated", with: @assignment_submission.timecreated
    fill_in "Timemarked", with: @assignment_submission.timemarked
    fill_in "Timemodified", with: @assignment_submission.timemodified
    fill_in "Userid", with: @assignment_submission.userid
    click_on "Create Assignment submission"

    assert_text "Assignment submission was successfully created"
    click_on "Back"
  end

  test "updating a Assignment submission" do
    visit assignment_submissions_url
    click_on "Edit", match: :first

    fill_in "Assignment", with: @assignment_submission.assignment
    fill_in "Data1", with: @assignment_submission.data1
    fill_in "Data2", with: @assignment_submission.data2
    fill_in "Format", with: @assignment_submission.format
    fill_in "Grade", with: @assignment_submission.grade
    fill_in "Mailed", with: @assignment_submission.mailed
    fill_in "Numfiles", with: @assignment_submission.numfiles
    fill_in "Submissioncomment", with: @assignment_submission.submissioncomment
    fill_in "Teacher", with: @assignment_submission.teacher
    fill_in "Timecreated", with: @assignment_submission.timecreated
    fill_in "Timemarked", with: @assignment_submission.timemarked
    fill_in "Timemodified", with: @assignment_submission.timemodified
    fill_in "Userid", with: @assignment_submission.userid
    click_on "Update Assignment submission"

    assert_text "Assignment submission was successfully updated"
    click_on "Back"
  end

  test "destroying a Assignment submission" do
    visit assignment_submissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assignment submission was successfully destroyed"
  end
end
