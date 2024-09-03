json.data do 
  json.users @data do |data|
    json.id data.id
    json.email data.email
    json.created_at data.created_at
  end
  json.status @status
  json.message @message
end
