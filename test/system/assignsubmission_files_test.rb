require "application_system_test_case"

class AssignsubmissionFilesTest < ApplicationSystemTestCase
  setup do
    @assignsubmission_file = assignsubmission_files(:one)
  end

  test "visiting the index" do
    visit assignsubmission_files_url
    assert_selector "h1", text: "Assignsubmission Files"
  end

  test "creating a Assignsubmission file" do
    visit assignsubmission_files_url
    click_on "New Assignsubmission File"

    fill_in "Assignment", with: @assignsubmission_file.assignment
    fill_in "Numfiles", with: @assignsubmission_file.numfiles
    fill_in "Submission", with: @assignsubmission_file.submission
    click_on "Create Assignsubmission file"

    assert_text "Assignsubmission file was successfully created"
    click_on "Back"
  end

  test "updating a Assignsubmission file" do
    visit assignsubmission_files_url
    click_on "Edit", match: :first

    fill_in "Assignment", with: @assignsubmission_file.assignment
    fill_in "Numfiles", with: @assignsubmission_file.numfiles
    fill_in "Submission", with: @assignsubmission_file.submission
    click_on "Update Assignsubmission file"

    assert_text "Assignsubmission file was successfully updated"
    click_on "Back"
  end

  test "destroying a Assignsubmission file" do
    visit assignsubmission_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assignsubmission file was successfully destroyed"
  end
end
