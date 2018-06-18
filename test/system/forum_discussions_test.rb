require "application_system_test_case"

class ForumDiscussionsTest < ApplicationSystemTestCase
  setup do
    @forum_discussion = forum_discussions(:one)
  end

  test "visiting the index" do
    visit forum_discussions_url
    assert_selector "h1", text: "Forum Discussions"
  end

  test "creating a Forum discussion" do
    visit forum_discussions_url
    click_on "New Forum Discussion"

    fill_in "Assessed", with: @forum_discussion.assessed
    fill_in "Course", with: @forum_discussion.course
    fill_in "Firstpost", with: @forum_discussion.firstpost
    fill_in "Forum", with: @forum_discussion.forum
    fill_in "Groupid", with: @forum_discussion.groupid
    fill_in "Name", with: @forum_discussion.name
    fill_in "Timeend", with: @forum_discussion.timeend
    fill_in "Timemodified", with: @forum_discussion.timemodified
    fill_in "Timestart", with: @forum_discussion.timestart
    fill_in "Userid", with: @forum_discussion.userid
    fill_in "Usermodified", with: @forum_discussion.usermodified
    click_on "Create Forum discussion"

    assert_text "Forum discussion was successfully created"
    click_on "Back"
  end

  test "updating a Forum discussion" do
    visit forum_discussions_url
    click_on "Edit", match: :first

    fill_in "Assessed", with: @forum_discussion.assessed
    fill_in "Course", with: @forum_discussion.course
    fill_in "Firstpost", with: @forum_discussion.firstpost
    fill_in "Forum", with: @forum_discussion.forum
    fill_in "Groupid", with: @forum_discussion.groupid
    fill_in "Name", with: @forum_discussion.name
    fill_in "Timeend", with: @forum_discussion.timeend
    fill_in "Timemodified", with: @forum_discussion.timemodified
    fill_in "Timestart", with: @forum_discussion.timestart
    fill_in "Userid", with: @forum_discussion.userid
    fill_in "Usermodified", with: @forum_discussion.usermodified
    click_on "Update Forum discussion"

    assert_text "Forum discussion was successfully updated"
    click_on "Back"
  end

  test "destroying a Forum discussion" do
    visit forum_discussions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forum discussion was successfully destroyed"
  end
end
