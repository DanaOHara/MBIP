require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Address", with: @user.address
    fill_in "Aim", with: @user.aim
    fill_in "Alternatename", with: @user.alternatename
    fill_in "Auth", with: @user.auth
    fill_in "Autosubscribe", with: @user.autosubscribe
    fill_in "Calendartype", with: @user.calendartype
    fill_in "City", with: @user.city
    fill_in "Confirmed", with: @user.confirmed
    fill_in "Country", with: @user.country
    fill_in "Currentlogin", with: @user.currentlogin
    fill_in "Deleted", with: @user.deleted
    fill_in "Department", with: @user.department
    fill_in "Description", with: @user.description
    fill_in "Descriptionformat", with: @user.descriptionformat
    fill_in "Email", with: @user.email
    fill_in "Emailstop", with: @user.emailstop
    fill_in "Firstaccess", with: @user.firstaccess
    fill_in "Firstname", with: @user.firstname
    fill_in "Firstnamephonetic", with: @user.firstnamephonetic
    fill_in "Icq", with: @user.icq
    fill_in "Idnumber", with: @user.idnumber
    fill_in "Imagealt", with: @user.imagealt
    fill_in "Institution", with: @user.institution
    fill_in "Lang", with: @user.lang
    fill_in "Lastaccess", with: @user.lastaccess
    fill_in "Lastip", with: @user.lastip
    fill_in "Lastlogin", with: @user.lastlogin
    fill_in "Lastname", with: @user.lastname
    fill_in "Lastnamephonetic", with: @user.lastnamephonetic
    fill_in "Maildigest", with: @user.maildigest
    fill_in "Maildisplay", with: @user.maildisplay
    fill_in "Mailformat", with: @user.mailformat
    fill_in "Middlename", with: @user.middlename
    fill_in "Mnethostid", with: @user.mnethostid
    fill_in "Msn", with: @user.msn
    fill_in "Password", with: @user.password
    fill_in "Phone1", with: @user.phone1
    fill_in "Phone2", with: @user.phone2
    fill_in "Picture", with: @user.picture
    fill_in "Policyagreed", with: @user.policyagreed
    fill_in "Secret", with: @user.secret
    fill_in "Skype", with: @user.skype
    fill_in "Suspended", with: @user.suspended
    fill_in "Theme", with: @user.theme
    fill_in "Timecreated", with: @user.timecreated
    fill_in "Timemodified", with: @user.timemodified
    fill_in "Timezone", with: @user.timezone
    fill_in "Trackforums", with: @user.trackforums
    fill_in "Trustbitmask", with: @user.trustbitmask
    fill_in "Url", with: @user.url
    fill_in "Username", with: @user.username
    fill_in "Yahoo", with: @user.yahoo
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Address", with: @user.address
    fill_in "Aim", with: @user.aim
    fill_in "Alternatename", with: @user.alternatename
    fill_in "Auth", with: @user.auth
    fill_in "Autosubscribe", with: @user.autosubscribe
    fill_in "Calendartype", with: @user.calendartype
    fill_in "City", with: @user.city
    fill_in "Confirmed", with: @user.confirmed
    fill_in "Country", with: @user.country
    fill_in "Currentlogin", with: @user.currentlogin
    fill_in "Deleted", with: @user.deleted
    fill_in "Department", with: @user.department
    fill_in "Description", with: @user.description
    fill_in "Descriptionformat", with: @user.descriptionformat
    fill_in "Email", with: @user.email
    fill_in "Emailstop", with: @user.emailstop
    fill_in "Firstaccess", with: @user.firstaccess
    fill_in "Firstname", with: @user.firstname
    fill_in "Firstnamephonetic", with: @user.firstnamephonetic
    fill_in "Icq", with: @user.icq
    fill_in "Idnumber", with: @user.idnumber
    fill_in "Imagealt", with: @user.imagealt
    fill_in "Institution", with: @user.institution
    fill_in "Lang", with: @user.lang
    fill_in "Lastaccess", with: @user.lastaccess
    fill_in "Lastip", with: @user.lastip
    fill_in "Lastlogin", with: @user.lastlogin
    fill_in "Lastname", with: @user.lastname
    fill_in "Lastnamephonetic", with: @user.lastnamephonetic
    fill_in "Maildigest", with: @user.maildigest
    fill_in "Maildisplay", with: @user.maildisplay
    fill_in "Mailformat", with: @user.mailformat
    fill_in "Middlename", with: @user.middlename
    fill_in "Mnethostid", with: @user.mnethostid
    fill_in "Msn", with: @user.msn
    fill_in "Password", with: @user.password
    fill_in "Phone1", with: @user.phone1
    fill_in "Phone2", with: @user.phone2
    fill_in "Picture", with: @user.picture
    fill_in "Policyagreed", with: @user.policyagreed
    fill_in "Secret", with: @user.secret
    fill_in "Skype", with: @user.skype
    fill_in "Suspended", with: @user.suspended
    fill_in "Theme", with: @user.theme
    fill_in "Timecreated", with: @user.timecreated
    fill_in "Timemodified", with: @user.timemodified
    fill_in "Timezone", with: @user.timezone
    fill_in "Trackforums", with: @user.trackforums
    fill_in "Trustbitmask", with: @user.trustbitmask
    fill_in "Url", with: @user.url
    fill_in "Username", with: @user.username
    fill_in "Yahoo", with: @user.yahoo
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
