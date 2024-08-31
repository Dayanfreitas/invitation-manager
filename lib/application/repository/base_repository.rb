class BaseRepository
  def initialize(model)
    @model = @model
  end

  def all
    raise NotImplementedError
  end

  def create
    raise NotImplementedError
  end

  def update
    raise NotImplementedError
  end

  def destroy
    raise NotImplementedError
  end

  def find
    raise NotImplementedError
  end
end