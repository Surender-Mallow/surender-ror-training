json.extract! job, :id, :title, :description, :location, :salary, :created_at, :updated_at
json.url job_url(job, format: :json)
