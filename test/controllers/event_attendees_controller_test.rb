require 'test_helper'

class EventAttendeesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get event_attendees_create_url
    assert_response :success
  end

  test "should get destroy" do
    get event_attendees_destroy_url
    assert_response :success
  end

end
