class QueryBuilderBase
  def initialize
    @conditions = {}
  end

  def with_id(id)
    @conditions[:id] = id
    self
  end

  def build
    @conditions.compact
  end
end