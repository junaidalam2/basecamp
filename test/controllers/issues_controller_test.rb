require "test_helper"

class IssuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @issue = issues(:one)
  end

  test "should get index" do
    get issues_url
    assert_response :success
  end

  test "should get new" do
    get new_issue_url
    assert_response :success
  end

  test "should create issue" do
    assert_difference("Issue.count") do
      post issues_url, params: { issue: { assigned_to: @issue.assigned_to, creation_date: @issue.creation_date, detailed_description: @issue.detailed_description, priority: @issue.priority, resolution_date: @issue.resolution_date, short_description: @issue.short_description, status: @issue.status, steps_to_reproduce: @issue.steps_to_reproduce, target_resolution_date: @issue.target_resolution_date } }
    end

    assert_redirected_to issue_url(Issue.last)
  end

  test "should show issue" do
    get issue_url(@issue)
    assert_response :success
  end

  test "should get edit" do
    get edit_issue_url(@issue)
    assert_response :success
  end

  test "should update issue" do
    patch issue_url(@issue), params: { issue: { assigned_to: @issue.assigned_to, creation_date: @issue.creation_date, detailed_description: @issue.detailed_description, priority: @issue.priority, resolution_date: @issue.resolution_date, short_description: @issue.short_description, status: @issue.status, steps_to_reproduce: @issue.steps_to_reproduce, target_resolution_date: @issue.target_resolution_date } }
    assert_redirected_to issue_url(@issue)
  end

  test "should destroy issue" do
    assert_difference("Issue.count", -1) do
      delete issue_url(@issue)
    end

    assert_redirected_to issues_url
  end
end
