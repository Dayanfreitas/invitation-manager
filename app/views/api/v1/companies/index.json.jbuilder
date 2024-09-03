json.data do 
  json.companies @data do |data|
    json.id data.id
    json.name data.name
  end
  json.status @status
  json.message @message
end
