json.data do
  json.invite do
    json.id @data.id
    json.status @data.status
    json.invited_at @data.invited_at
    json.created_at @data.created_at  
  end
  json.status @status
  json.message @message    
end
