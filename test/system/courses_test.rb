require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
  end

  test "creating a Course" do
    visit courses_url
    click_on "New Course"

    fill_in "Cacherev", with: @course.cacherev
    fill_in "Calendartype", with: @course.calendartype
    fill_in "Category", with: @course.category
    fill_in "Completionnotify", with: @course.completionnotify
    fill_in "Defaultgroupingid", with: @course.defaultgroupingid
    fill_in "Enablecompletion", with: @course.enablecompletion
    fill_in "Format", with: @course.format
    fill_in "Fullname", with: @course.fullname
    fill_in "Groupmode", with: @course.groupmode
    fill_in "Groupmodeforce", with: @course.groupmodeforce
    fill_in "Idnumber", with: @course.idnumber
    fill_in "Lang", with: @course.lang
    fill_in "Legacyfiles", with: @course.legacyfiles
    fill_in "Marker", with: @course.marker
    fill_in "Maxbytes", with: @course.maxbytes
    fill_in "Newsitems", with: @course.newsitems
    fill_in "Requested", with: @course.requested
    fill_in "Shortname", with: @course.shortname
    fill_in "Showgrades", with: @course.showgrades
    fill_in "Showreports", with: @course.showreports
    fill_in "Sortorder", with: @course.sortorder
    fill_in "Startdate", with: @course.startdate
    fill_in "Summary", with: @course.summary
    fill_in "Summaryformat", with: @course.summaryformat
    fill_in "Theme", with: @course.theme
    fill_in "Timecreated", with: @course.timecreated
    fill_in "Timemodified", with: @course.timemodified
    fill_in "Visible", with: @course.visible
    fill_in "Visibleold", with: @course.visibleold
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "updating a Course" do
    visit courses_url
    click_on "Edit", match: :first

    fill_in "Cacherev", with: @course.cacherev
    fill_in "Calendartype", with: @course.calendartype
    fill_in "Category", with: @course.category
    fill_in "Completionnotify", with: @course.completionnotify
    fill_in "Defaultgroupingid", with: @course.defaultgroupingid
    fill_in "Enablecompletion", with: @course.enablecompletion
    fill_in "Format", with: @course.format
    fill_in "Fullname", with: @course.fullname
    fill_in "Groupmode", with: @course.groupmode
    fill_in "Groupmodeforce", with: @course.groupmodeforce
    fill_in "Idnumber", with: @course.idnumber
    fill_in "Lang", with: @course.lang
    fill_in "Legacyfiles", with: @course.legacyfiles
    fill_in "Marker", with: @course.marker
    fill_in "Maxbytes", with: @course.maxbytes
    fill_in "Newsitems", with: @course.newsitems
    fill_in "Requested", with: @course.requested
    fill_in "Shortname", with: @course.shortname
    fill_in "Showgrades", with: @course.showgrades
    fill_in "Showreports", with: @course.showreports
    fill_in "Sortorder", with: @course.sortorder
    fill_in "Startdate", with: @course.startdate
    fill_in "Summary", with: @course.summary
    fill_in "Summaryformat", with: @course.summaryformat
    fill_in "Theme", with: @course.theme
    fill_in "Timecreated", with: @course.timecreated
    fill_in "Timemodified", with: @course.timemodified
    fill_in "Visible", with: @course.visible
    fill_in "Visibleold", with: @course.visibleold
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "destroying a Course" do
    visit courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course was successfully destroyed"
  end
end
