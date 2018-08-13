require "application_system_test_case"

class MdlFilesTest < ApplicationSystemTestCase
  setup do
    @mdl_file = mdl_files(:one)
  end

  test "visiting the index" do
    visit mdl_files_url
    assert_selector "h1", text: "Mdl Files"
  end

  test "creating a Mdl file" do
    visit mdl_files_url
    click_on "New Mdl File"

    fill_in "Author", with: @mdl_file.author
    fill_in "Component", with: @mdl_file.component
    fill_in "Contenthash", with: @mdl_file.contenthash
    fill_in "Contextid", with: @mdl_file.contextid
    fill_in "Filearea", with: @mdl_file.filearea
    fill_in "Filename", with: @mdl_file.filename
    fill_in "Filepath", with: @mdl_file.filepath
    fill_in "Filesize", with: @mdl_file.filesize
    fill_in "Itemid", with: @mdl_file.itemid
    fill_in "License", with: @mdl_file.license
    fill_in "Mimetype", with: @mdl_file.mimetype
    fill_in "Pathnamehash", with: @mdl_file.pathnamehash
    fill_in "Referencefileid", with: @mdl_file.referencefileid
    fill_in "Sortorder", with: @mdl_file.sortorder
    fill_in "Source", with: @mdl_file.source
    fill_in "Status", with: @mdl_file.status
    fill_in "Timecreated", with: @mdl_file.timecreated
    fill_in "Timemodified", with: @mdl_file.timemodified
    fill_in "Userid", with: @mdl_file.userid
    click_on "Create Mdl file"

    assert_text "Mdl file was successfully created"
    click_on "Back"
  end

  test "updating a Mdl file" do
    visit mdl_files_url
    click_on "Edit", match: :first

    fill_in "Author", with: @mdl_file.author
    fill_in "Component", with: @mdl_file.component
    fill_in "Contenthash", with: @mdl_file.contenthash
    fill_in "Contextid", with: @mdl_file.contextid
    fill_in "Filearea", with: @mdl_file.filearea
    fill_in "Filename", with: @mdl_file.filename
    fill_in "Filepath", with: @mdl_file.filepath
    fill_in "Filesize", with: @mdl_file.filesize
    fill_in "Itemid", with: @mdl_file.itemid
    fill_in "License", with: @mdl_file.license
    fill_in "Mimetype", with: @mdl_file.mimetype
    fill_in "Pathnamehash", with: @mdl_file.pathnamehash
    fill_in "Referencefileid", with: @mdl_file.referencefileid
    fill_in "Sortorder", with: @mdl_file.sortorder
    fill_in "Source", with: @mdl_file.source
    fill_in "Status", with: @mdl_file.status
    fill_in "Timecreated", with: @mdl_file.timecreated
    fill_in "Timemodified", with: @mdl_file.timemodified
    fill_in "Userid", with: @mdl_file.userid
    click_on "Update Mdl file"

    assert_text "Mdl file was successfully updated"
    click_on "Back"
  end

  test "destroying a Mdl file" do
    visit mdl_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mdl file was successfully destroyed"
  end
end
