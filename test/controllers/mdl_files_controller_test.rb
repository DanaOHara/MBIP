require 'test_helper'

class MdlFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mdl_file = mdl_files(:one)
  end

  test "should get index" do
    get mdl_files_url
    assert_response :success
  end

  test "should get new" do
    get new_mdl_file_url
    assert_response :success
  end

  test "should create mdl_file" do
    assert_difference('MdlFile.count') do
      post mdl_files_url, params: { mdl_file: { author: @mdl_file.author, component: @mdl_file.component, contenthash: @mdl_file.contenthash, contextid: @mdl_file.contextid, filearea: @mdl_file.filearea, filename: @mdl_file.filename, filepath: @mdl_file.filepath, filesize: @mdl_file.filesize, itemid: @mdl_file.itemid, license: @mdl_file.license, mimetype: @mdl_file.mimetype, pathnamehash: @mdl_file.pathnamehash, referencefileid: @mdl_file.referencefileid, sortorder: @mdl_file.sortorder, source: @mdl_file.source, status: @mdl_file.status, timecreated: @mdl_file.timecreated, timemodified: @mdl_file.timemodified, userid: @mdl_file.userid } }
    end

    assert_redirected_to mdl_file_url(MdlFile.last)
  end

  test "should show mdl_file" do
    get mdl_file_url(@mdl_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_mdl_file_url(@mdl_file)
    assert_response :success
  end

  test "should update mdl_file" do
    patch mdl_file_url(@mdl_file), params: { mdl_file: { author: @mdl_file.author, component: @mdl_file.component, contenthash: @mdl_file.contenthash, contextid: @mdl_file.contextid, filearea: @mdl_file.filearea, filename: @mdl_file.filename, filepath: @mdl_file.filepath, filesize: @mdl_file.filesize, itemid: @mdl_file.itemid, license: @mdl_file.license, mimetype: @mdl_file.mimetype, pathnamehash: @mdl_file.pathnamehash, referencefileid: @mdl_file.referencefileid, sortorder: @mdl_file.sortorder, source: @mdl_file.source, status: @mdl_file.status, timecreated: @mdl_file.timecreated, timemodified: @mdl_file.timemodified, userid: @mdl_file.userid } }
    assert_redirected_to mdl_file_url(@mdl_file)
  end

  test "should destroy mdl_file" do
    assert_difference('MdlFile.count', -1) do
      delete mdl_file_url(@mdl_file)
    end

    assert_redirected_to mdl_files_url
  end
end
