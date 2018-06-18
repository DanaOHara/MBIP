require 'test_helper'

class ForumPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forum_post = forum_posts(:one)
  end

  test "should get index" do
    get forum_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_forum_post_url
    assert_response :success
  end

  test "should create forum_post" do
    assert_difference('ForumPost.count') do
      post forum_posts_url, params: { forum_post: { attachment: @forum_post.attachment, created: @forum_post.created, discussion: @forum_post.discussion, mailed: @forum_post.mailed, mailnow: @forum_post.mailnow, message: @forum_post.message, messageformat: @forum_post.messageformat, messagetrust: @forum_post.messagetrust, modified: @forum_post.modified, parent: @forum_post.parent, subject: @forum_post.subject, totalscore: @forum_post.totalscore, userid: @forum_post.userid } }
    end

    assert_redirected_to forum_post_url(ForumPost.last)
  end

  test "should show forum_post" do
    get forum_post_url(@forum_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_forum_post_url(@forum_post)
    assert_response :success
  end

  test "should update forum_post" do
    patch forum_post_url(@forum_post), params: { forum_post: { attachment: @forum_post.attachment, created: @forum_post.created, discussion: @forum_post.discussion, mailed: @forum_post.mailed, mailnow: @forum_post.mailnow, message: @forum_post.message, messageformat: @forum_post.messageformat, messagetrust: @forum_post.messagetrust, modified: @forum_post.modified, parent: @forum_post.parent, subject: @forum_post.subject, totalscore: @forum_post.totalscore, userid: @forum_post.userid } }
    assert_redirected_to forum_post_url(@forum_post)
  end

  test "should destroy forum_post" do
    assert_difference('ForumPost.count', -1) do
      delete forum_post_url(@forum_post)
    end

    assert_redirected_to forum_posts_url
  end
end
