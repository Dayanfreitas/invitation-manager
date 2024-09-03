json.data do
  json.user do
    json.id @data.id
    json.email @data.email
    json.created_at @data.created_at
  end
  json.status @status
  json.message @message    
end
