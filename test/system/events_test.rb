require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    fill_in "Courseid", with: @event.courseid
    fill_in "Description", with: @event.description
    fill_in "Eventtype", with: @event.eventtype
    fill_in "Format", with: @event.format
    fill_in "Groupid", with: @event.groupid
    fill_in "Instance", with: @event.instance
    fill_in "Modulename", with: @event.modulename
    fill_in "Name", with: @event.name
    fill_in "Repeatid", with: @event.repeatid
    fill_in "Sequence", with: @event.sequence
    fill_in "Subscriptionid", with: @event.subscriptionid
    fill_in "Timeduration", with: @event.timeduration
    fill_in "Timemodified", with: @event.timemodified
    fill_in "Timestart", with: @event.timestart
    fill_in "Userid", with: @event.userid
    fill_in "Uuid", with: @event.uuid
    fill_in "Visible", with: @event.visible
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    fill_in "Courseid", with: @event.courseid
    fill_in "Description", with: @event.description
    fill_in "Eventtype", with: @event.eventtype
    fill_in "Format", with: @event.format
    fill_in "Groupid", with: @event.groupid
    fill_in "Instance", with: @event.instance
    fill_in "Modulename", with: @event.modulename
    fill_in "Name", with: @event.name
    fill_in "Repeatid", with: @event.repeatid
    fill_in "Sequence", with: @event.sequence
    fill_in "Subscriptionid", with: @event.subscriptionid
    fill_in "Timeduration", with: @event.timeduration
    fill_in "Timemodified", with: @event.timemodified
    fill_in "Timestart", with: @event.timestart
    fill_in "Userid", with: @event.userid
    fill_in "Uuid", with: @event.uuid
    fill_in "Visible", with: @event.visible
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
