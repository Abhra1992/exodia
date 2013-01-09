require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get contacts" do
    get :contacts
    assert_response :success
  end

  test "should get credits" do
    get :credits
    assert_response :success
  end

  test "should get hospitality" do
    get :hospitality
    assert_response :success
  end

  test "should get how_to_reach" do
    get :how_to_reach
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get license" do
    get :license
    assert_response :success
  end

  test "should get privacy" do
    get :privacy
    assert_response :success
  end

  test "should get schedule" do
    get :schedule
    assert_response :success
  end

  test "should get sitemap" do
    get :sitemap
    assert_response :success
  end

  test "should get sponsors" do
    get :sponsors
    assert_response :success
  end

end
