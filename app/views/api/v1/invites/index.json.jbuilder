json.data do 
  byebug
  json.invite @data do |data|
    json.id data.id
    json.status data.status
    json.email data.user.email if data.user.present?
    json.company data.company.name if data.company.present?
    json.invited_at data.invited_at
    json.created_at data.created_at
    json.inactivated_at data.inactivated_at
  end
  json.status @status
  json.message @message
end
