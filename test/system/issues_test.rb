require "application_system_test_case"

class IssuesTest < ApplicationSystemTestCase
  setup do
    @issue = issues(:one)
  end

  test "visiting the index" do
    visit issues_url
    assert_selector "h1", text: "Issues"
  end

  test "should create issue" do
    visit issues_url
    click_on "New issue"

    fill_in "Assigned to", with: @issue.assigned_to
    fill_in "Creation date", with: @issue.creation_date
    fill_in "Detailed description", with: @issue.detailed_description
    fill_in "Priority", with: @issue.priority
    fill_in "Resolution date", with: @issue.resolution_date
    fill_in "Short description", with: @issue.short_description
    fill_in "Status", with: @issue.status
    fill_in "Steps to reproduce", with: @issue.steps_to_reproduce
    fill_in "Target resolution date", with: @issue.target_resolution_date
    click_on "Create Issue"

    assert_text "Issue was successfully created"
    click_on "Back"
  end

  test "should update Issue" do
    visit issue_url(@issue)
    click_on "Edit this issue", match: :first

    fill_in "Assigned to", with: @issue.assigned_to
    fill_in "Creation date", with: @issue.creation_date
    fill_in "Detailed description", with: @issue.detailed_description
    fill_in "Priority", with: @issue.priority
    fill_in "Resolution date", with: @issue.resolution_date
    fill_in "Short description", with: @issue.short_description
    fill_in "Status", with: @issue.status
    fill_in "Steps to reproduce", with: @issue.steps_to_reproduce
    fill_in "Target resolution date", with: @issue.target_resolution_date
    click_on "Update Issue"

    assert_text "Issue was successfully updated"
    click_on "Back"
  end

  test "should destroy Issue" do
    visit issue_url(@issue)
    click_on "Destroy this issue", match: :first

    assert_text "Issue was successfully destroyed"
  end
end
