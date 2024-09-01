class InviteQueryBuilder < QueryBuilderBase  
  def with_user_id(user_id)
    @conditions[:user_id] = user_id
    self
  end

  def with_company_id(company_id)
    @conditions[:company_id] = company_id
    self
  end

  def with_token(token)
    @conditions[:token] = token
    self
  end

  def with_status(status)
    @conditions[:status] = status
    self
  end
  
  def build
    @conditions.compact
  end
end