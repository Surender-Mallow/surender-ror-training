json.extract! user, :id, :first_name, :last_name, :email, :user_type, :created_at, :updated_at
json.company do
  json.partial! "companies/company", company: user.company
end
json.url user_url(user, format: :json)
