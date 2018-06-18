require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { address: @user.address, aim: @user.aim, alternatename: @user.alternatename, auth: @user.auth, autosubscribe: @user.autosubscribe, calendartype: @user.calendartype, city: @user.city, confirmed: @user.confirmed, country: @user.country, currentlogin: @user.currentlogin, deleted: @user.deleted, department: @user.department, description: @user.description, descriptionformat: @user.descriptionformat, email: @user.email, emailstop: @user.emailstop, firstaccess: @user.firstaccess, firstname: @user.firstname, firstnamephonetic: @user.firstnamephonetic, icq: @user.icq, idnumber: @user.idnumber, imagealt: @user.imagealt, institution: @user.institution, lang: @user.lang, lastaccess: @user.lastaccess, lastip: @user.lastip, lastlogin: @user.lastlogin, lastname: @user.lastname, lastnamephonetic: @user.lastnamephonetic, maildigest: @user.maildigest, maildisplay: @user.maildisplay, mailformat: @user.mailformat, middlename: @user.middlename, mnethostid: @user.mnethostid, msn: @user.msn, password: @user.password, phone1: @user.phone1, phone2: @user.phone2, picture: @user.picture, policyagreed: @user.policyagreed, secret: @user.secret, skype: @user.skype, suspended: @user.suspended, theme: @user.theme, timecreated: @user.timecreated, timemodified: @user.timemodified, timezone: @user.timezone, trackforums: @user.trackforums, trustbitmask: @user.trustbitmask, url: @user.url, username: @user.username, yahoo: @user.yahoo } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address: @user.address, aim: @user.aim, alternatename: @user.alternatename, auth: @user.auth, autosubscribe: @user.autosubscribe, calendartype: @user.calendartype, city: @user.city, confirmed: @user.confirmed, country: @user.country, currentlogin: @user.currentlogin, deleted: @user.deleted, department: @user.department, description: @user.description, descriptionformat: @user.descriptionformat, email: @user.email, emailstop: @user.emailstop, firstaccess: @user.firstaccess, firstname: @user.firstname, firstnamephonetic: @user.firstnamephonetic, icq: @user.icq, idnumber: @user.idnumber, imagealt: @user.imagealt, institution: @user.institution, lang: @user.lang, lastaccess: @user.lastaccess, lastip: @user.lastip, lastlogin: @user.lastlogin, lastname: @user.lastname, lastnamephonetic: @user.lastnamephonetic, maildigest: @user.maildigest, maildisplay: @user.maildisplay, mailformat: @user.mailformat, middlename: @user.middlename, mnethostid: @user.mnethostid, msn: @user.msn, password: @user.password, phone1: @user.phone1, phone2: @user.phone2, picture: @user.picture, policyagreed: @user.policyagreed, secret: @user.secret, skype: @user.skype, suspended: @user.suspended, theme: @user.theme, timecreated: @user.timecreated, timemodified: @user.timemodified, timezone: @user.timezone, trackforums: @user.trackforums, trustbitmask: @user.trustbitmask, url: @user.url, username: @user.username, yahoo: @user.yahoo } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
