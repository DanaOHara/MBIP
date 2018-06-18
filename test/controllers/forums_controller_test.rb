require 'test_helper'

class ForumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forum = forums(:one)
  end

  test "should get index" do
    get forums_url
    assert_response :success
  end

  test "should get new" do
    get new_forum_url
    assert_response :success
  end

  test "should create forum" do
    assert_difference('Forum.count') do
      post forums_url, params: { forum: { assessed: @forum.assessed, assesstimefinish: @forum.assesstimefinish, assesstimestart: @forum.assesstimestart, blockafter: @forum.blockafter, blockperiod: @forum.blockperiod, completiondiscussions: @forum.completiondiscussions, completionposts: @forum.completionposts, completionreplies: @forum.completionreplies, course: @forum.course, displaywordcount: @forum.displaywordcount, forcesubscribe: @forum.forcesubscribe, intro: @forum.intro, introformat: @forum.introformat, maxattachments: @forum.maxattachments, maxbytes: @forum.maxbytes, name: @forum.name, rssarticles: @forum.rssarticles, rsstype: @forum.rsstype, scale: @forum.scale, timemodified: @forum.timemodified, trackingtype: @forum.trackingtype, type: @forum.type, warnafter: @forum.warnafter } }
    end

    assert_redirected_to forum_url(Forum.last)
  end

  test "should show forum" do
    get forum_url(@forum)
    assert_response :success
  end

  test "should get edit" do
    get edit_forum_url(@forum)
    assert_response :success
  end

  test "should update forum" do
    patch forum_url(@forum), params: { forum: { assessed: @forum.assessed, assesstimefinish: @forum.assesstimefinish, assesstimestart: @forum.assesstimestart, blockafter: @forum.blockafter, blockperiod: @forum.blockperiod, completiondiscussions: @forum.completiondiscussions, completionposts: @forum.completionposts, completionreplies: @forum.completionreplies, course: @forum.course, displaywordcount: @forum.displaywordcount, forcesubscribe: @forum.forcesubscribe, intro: @forum.intro, introformat: @forum.introformat, maxattachments: @forum.maxattachments, maxbytes: @forum.maxbytes, name: @forum.name, rssarticles: @forum.rssarticles, rsstype: @forum.rsstype, scale: @forum.scale, timemodified: @forum.timemodified, trackingtype: @forum.trackingtype, type: @forum.type, warnafter: @forum.warnafter } }
    assert_redirected_to forum_url(@forum)
  end

  test "should destroy forum" do
    assert_difference('Forum.count', -1) do
      delete forum_url(@forum)
    end

    assert_redirected_to forums_url
  end
end
