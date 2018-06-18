require "application_system_test_case"

class ForumPostsTest < ApplicationSystemTestCase
  setup do
    @forum_post = forum_posts(:one)
  end

  test "visiting the index" do
    visit forum_posts_url
    assert_selector "h1", text: "Forum Posts"
  end

  test "creating a Forum post" do
    visit forum_posts_url
    click_on "New Forum Post"

    fill_in "Attachment", with: @forum_post.attachment
    fill_in "Created", with: @forum_post.created
    fill_in "Discussion", with: @forum_post.discussion
    fill_in "Mailed", with: @forum_post.mailed
    fill_in "Mailnow", with: @forum_post.mailnow
    fill_in "Message", with: @forum_post.message
    fill_in "Messageformat", with: @forum_post.messageformat
    fill_in "Messagetrust", with: @forum_post.messagetrust
    fill_in "Modified", with: @forum_post.modified
    fill_in "Parent", with: @forum_post.parent
    fill_in "Subject", with: @forum_post.subject
    fill_in "Totalscore", with: @forum_post.totalscore
    fill_in "Userid", with: @forum_post.userid
    click_on "Create Forum post"

    assert_text "Forum post was successfully created"
    click_on "Back"
  end

  test "updating a Forum post" do
    visit forum_posts_url
    click_on "Edit", match: :first

    fill_in "Attachment", with: @forum_post.attachment
    fill_in "Created", with: @forum_post.created
    fill_in "Discussion", with: @forum_post.discussion
    fill_in "Mailed", with: @forum_post.mailed
    fill_in "Mailnow", with: @forum_post.mailnow
    fill_in "Message", with: @forum_post.message
    fill_in "Messageformat", with: @forum_post.messageformat
    fill_in "Messagetrust", with: @forum_post.messagetrust
    fill_in "Modified", with: @forum_post.modified
    fill_in "Parent", with: @forum_post.parent
    fill_in "Subject", with: @forum_post.subject
    fill_in "Totalscore", with: @forum_post.totalscore
    fill_in "Userid", with: @forum_post.userid
    click_on "Update Forum post"

    assert_text "Forum post was successfully updated"
    click_on "Back"
  end

  test "destroying a Forum post" do
    visit forum_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forum post was successfully destroyed"
  end
end
