json.data do
  json.user do
    json.id @data.id
    json.name @data.name
    json.created_at @data.created_at
  end
  json.status @status
  json.message @message    
end
