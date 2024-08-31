class UsersRepository < BaseRepository
  def initialize
    super(User)
  end

  def create(attributes: {})
    @model.create(attributes)
  end

  def update(id:, attributes: {})
    self.find(id)&.update(attributes)
  end
  
  def destroy(id)
    self.find(id)&.destroy
  end
  
  def find(id)
    @model.find_by_id(id)
  end
end