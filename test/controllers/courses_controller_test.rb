require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should get new" do
    get new_course_url
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post courses_url, params: { course: { cacherev: @course.cacherev, calendartype: @course.calendartype, category: @course.category, completionnotify: @course.completionnotify, defaultgroupingid: @course.defaultgroupingid, enablecompletion: @course.enablecompletion, format: @course.format, fullname: @course.fullname, groupmode: @course.groupmode, groupmodeforce: @course.groupmodeforce, idnumber: @course.idnumber, lang: @course.lang, legacyfiles: @course.legacyfiles, marker: @course.marker, maxbytes: @course.maxbytes, newsitems: @course.newsitems, requested: @course.requested, shortname: @course.shortname, showgrades: @course.showgrades, showreports: @course.showreports, sortorder: @course.sortorder, startdate: @course.startdate, summary: @course.summary, summaryformat: @course.summaryformat, theme: @course.theme, timecreated: @course.timecreated, timemodified: @course.timemodified, visible: @course.visible, visibleold: @course.visibleold } }
    end

    assert_redirected_to course_url(Course.last)
  end

  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course), params: { course: { cacherev: @course.cacherev, calendartype: @course.calendartype, category: @course.category, completionnotify: @course.completionnotify, defaultgroupingid: @course.defaultgroupingid, enablecompletion: @course.enablecompletion, format: @course.format, fullname: @course.fullname, groupmode: @course.groupmode, groupmodeforce: @course.groupmodeforce, idnumber: @course.idnumber, lang: @course.lang, legacyfiles: @course.legacyfiles, marker: @course.marker, maxbytes: @course.maxbytes, newsitems: @course.newsitems, requested: @course.requested, shortname: @course.shortname, showgrades: @course.showgrades, showreports: @course.showreports, sortorder: @course.sortorder, startdate: @course.startdate, summary: @course.summary, summaryformat: @course.summaryformat, theme: @course.theme, timecreated: @course.timecreated, timemodified: @course.timemodified, visible: @course.visible, visibleold: @course.visibleold } }
    assert_redirected_to course_url(@course)
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end
