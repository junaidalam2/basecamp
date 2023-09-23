json.extract! issue, :id, :creation_date, :short_description, :detailed_description, :steps_to_reproduce, :status, :priority, :assigned_to, :target_resolution_date, :resolution_date, :created_at, :updated_at
json.url issue_url(issue, format: :json)
