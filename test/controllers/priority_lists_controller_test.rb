require "test_helper"

class PriorityListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @priority_list = priority_lists(:one)
  end

  test "should get index" do
    get priority_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_priority_list_url
    assert_response :success
  end

  test "should create priority_list" do
    assert_difference("PriorityList.count") do
      post priority_lists_url, params: { priority_list: { priority_list: @priority_list.priority_list } }
    end

    assert_redirected_to priority_list_url(PriorityList.last)
  end

  test "should show priority_list" do
    get priority_list_url(@priority_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_priority_list_url(@priority_list)
    assert_response :success
  end

  test "should update priority_list" do
    patch priority_list_url(@priority_list), params: { priority_list: { priority_list: @priority_list.priority_list } }
    assert_redirected_to priority_list_url(@priority_list)
  end

  test "should destroy priority_list" do
    assert_difference("PriorityList.count", -1) do
      delete priority_list_url(@priority_list)
    end

    assert_redirected_to priority_lists_url
  end
end
