require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: { event: { courseid: @event.courseid, description: @event.description, eventtype: @event.eventtype, format: @event.format, groupid: @event.groupid, instance: @event.instance, modulename: @event.modulename, name: @event.name, repeatid: @event.repeatid, sequence: @event.sequence, subscriptionid: @event.subscriptionid, timeduration: @event.timeduration, timemodified: @event.timemodified, timestart: @event.timestart, userid: @event.userid, uuid: @event.uuid, visible: @event.visible } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { courseid: @event.courseid, description: @event.description, eventtype: @event.eventtype, format: @event.format, groupid: @event.groupid, instance: @event.instance, modulename: @event.modulename, name: @event.name, repeatid: @event.repeatid, sequence: @event.sequence, subscriptionid: @event.subscriptionid, timeduration: @event.timeduration, timemodified: @event.timemodified, timestart: @event.timestart, userid: @event.userid, uuid: @event.uuid, visible: @event.visible } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
