class BaseService
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

  def all
    raise NotImplementedError
  end
end