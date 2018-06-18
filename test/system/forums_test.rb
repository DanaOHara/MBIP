require "application_system_test_case"

class ForumsTest < ApplicationSystemTestCase
  setup do
    @forum = forums(:one)
  end

  test "visiting the index" do
    visit forums_url
    assert_selector "h1", text: "Forums"
  end

  test "creating a Forum" do
    visit forums_url
    click_on "New Forum"

    fill_in "Assessed", with: @forum.assessed
    fill_in "Assesstimefinish", with: @forum.assesstimefinish
    fill_in "Assesstimestart", with: @forum.assesstimestart
    fill_in "Blockafter", with: @forum.blockafter
    fill_in "Blockperiod", with: @forum.blockperiod
    fill_in "Completiondiscussions", with: @forum.completiondiscussions
    fill_in "Completionposts", with: @forum.completionposts
    fill_in "Completionreplies", with: @forum.completionreplies
    fill_in "Course", with: @forum.course
    fill_in "Displaywordcount", with: @forum.displaywordcount
    fill_in "Forcesubscribe", with: @forum.forcesubscribe
    fill_in "Intro", with: @forum.intro
    fill_in "Introformat", with: @forum.introformat
    fill_in "Maxattachments", with: @forum.maxattachments
    fill_in "Maxbytes", with: @forum.maxbytes
    fill_in "Name", with: @forum.name
    fill_in "Rssarticles", with: @forum.rssarticles
    fill_in "Rsstype", with: @forum.rsstype
    fill_in "Scale", with: @forum.scale
    fill_in "Timemodified", with: @forum.timemodified
    fill_in "Trackingtype", with: @forum.trackingtype
    fill_in "Type", with: @forum.type
    fill_in "Warnafter", with: @forum.warnafter
    click_on "Create Forum"

    assert_text "Forum was successfully created"
    click_on "Back"
  end

  test "updating a Forum" do
    visit forums_url
    click_on "Edit", match: :first

    fill_in "Assessed", with: @forum.assessed
    fill_in "Assesstimefinish", with: @forum.assesstimefinish
    fill_in "Assesstimestart", with: @forum.assesstimestart
    fill_in "Blockafter", with: @forum.blockafter
    fill_in "Blockperiod", with: @forum.blockperiod
    fill_in "Completiondiscussions", with: @forum.completiondiscussions
    fill_in "Completionposts", with: @forum.completionposts
    fill_in "Completionreplies", with: @forum.completionreplies
    fill_in "Course", with: @forum.course
    fill_in "Displaywordcount", with: @forum.displaywordcount
    fill_in "Forcesubscribe", with: @forum.forcesubscribe
    fill_in "Intro", with: @forum.intro
    fill_in "Introformat", with: @forum.introformat
    fill_in "Maxattachments", with: @forum.maxattachments
    fill_in "Maxbytes", with: @forum.maxbytes
    fill_in "Name", with: @forum.name
    fill_in "Rssarticles", with: @forum.rssarticles
    fill_in "Rsstype", with: @forum.rsstype
    fill_in "Scale", with: @forum.scale
    fill_in "Timemodified", with: @forum.timemodified
    fill_in "Trackingtype", with: @forum.trackingtype
    fill_in "Type", with: @forum.type
    fill_in "Warnafter", with: @forum.warnafter
    click_on "Update Forum"

    assert_text "Forum was successfully updated"
    click_on "Back"
  end

  test "destroying a Forum" do
    visit forums_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forum was successfully destroyed"
  end
end
