json.extract! employee, :id, :email, :name, :job, :salary, :employment_status, :team_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
