require 'test_helper'

class ForumDiscussionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forum_discussion = forum_discussions(:one)
  end

  test "should get index" do
    get forum_discussions_url
    assert_response :success
  end

  test "should get new" do
    get new_forum_discussion_url
    assert_response :success
  end

  test "should create forum_discussion" do
    assert_difference('ForumDiscussion.count') do
      post forum_discussions_url, params: { forum_discussion: { assessed: @forum_discussion.assessed, course: @forum_discussion.course, firstpost: @forum_discussion.firstpost, forum: @forum_discussion.forum, groupid: @forum_discussion.groupid, name: @forum_discussion.name, timeend: @forum_discussion.timeend, timemodified: @forum_discussion.timemodified, timestart: @forum_discussion.timestart, userid: @forum_discussion.userid, usermodified: @forum_discussion.usermodified } }
    end

    assert_redirected_to forum_discussion_url(ForumDiscussion.last)
  end

  test "should show forum_discussion" do
    get forum_discussion_url(@forum_discussion)
    assert_response :success
  end

  test "should get edit" do
    get edit_forum_discussion_url(@forum_discussion)
    assert_response :success
  end

  test "should update forum_discussion" do
    patch forum_discussion_url(@forum_discussion), params: { forum_discussion: { assessed: @forum_discussion.assessed, course: @forum_discussion.course, firstpost: @forum_discussion.firstpost, forum: @forum_discussion.forum, groupid: @forum_discussion.groupid, name: @forum_discussion.name, timeend: @forum_discussion.timeend, timemodified: @forum_discussion.timemodified, timestart: @forum_discussion.timestart, userid: @forum_discussion.userid, usermodified: @forum_discussion.usermodified } }
    assert_redirected_to forum_discussion_url(@forum_discussion)
  end

  test "should destroy forum_discussion" do
    assert_difference('ForumDiscussion.count', -1) do
      delete forum_discussion_url(@forum_discussion)
    end

    assert_redirected_to forum_discussions_url
  end
end
