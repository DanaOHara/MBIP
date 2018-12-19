require 'test_helper'

class AssignsubmissionFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assignsubmission_file = assignsubmission_files(:one)
  end

  test "should get index" do
    get assignsubmission_files_url
    assert_response :success
  end

  test "should get new" do
    get new_assignsubmission_file_url
    assert_response :success
  end

  test "should create assignsubmission_file" do
    assert_difference('AssignsubmissionFile.count') do
      post assignsubmission_files_url, params: { assignsubmission_file: { assignment: @assignsubmission_file.assignment, numfiles: @assignsubmission_file.numfiles, submission: @assignsubmission_file.submission } }
    end

    assert_redirected_to assignsubmission_file_url(AssignsubmissionFile.last)
  end

  test "should show assignsubmission_file" do
    get assignsubmission_file_url(@assignsubmission_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignsubmission_file_url(@assignsubmission_file)
    assert_response :success
  end

  test "should update assignsubmission_file" do
    patch assignsubmission_file_url(@assignsubmission_file), params: { assignsubmission_file: { assignment: @assignsubmission_file.assignment, numfiles: @assignsubmission_file.numfiles, submission: @assignsubmission_file.submission } }
    assert_redirected_to assignsubmission_file_url(@assignsubmission_file)
  end

  test "should destroy assignsubmission_file" do
    assert_difference('AssignsubmissionFile.count', -1) do
      delete assignsubmission_file_url(@assignsubmission_file)
    end

    assert_redirected_to assignsubmission_files_url
  end
end
