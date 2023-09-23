json.extract! project, :id, :name, :lead_first_name, :lead_last_name, :description, :time_frame_for_completion, :creation_date, :created_at, :updated_at
json.url project_url(project, format: :json)
