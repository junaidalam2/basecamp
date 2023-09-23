require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference("Project.count") do
      post projects_url, params: { project: { creation_date: @project.creation_date, description: @project.description, lead_first_name: @project.lead_first_name, lead_last_name: @project.lead_last_name, name: @project.name, time_frame_for_completion: @project.time_frame_for_completion } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { creation_date: @project.creation_date, description: @project.description, lead_first_name: @project.lead_first_name, lead_last_name: @project.lead_last_name, name: @project.name, time_frame_for_completion: @project.time_frame_for_completion } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference("Project.count", -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
