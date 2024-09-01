class CompaniesService < BaseService
  def initialize(repository)
    super(repository)
  end

  def create(attributes:)
    @repository.create(attributes: attributes)
  end

  def update(id:, attributes: {})
    @repository.update(id: id, attributes: attributes)
  end

  def destroy(id)
    @repository.destroy(id)
  end

  def find(id)
    @repository.find(id)
  end

  def new_instance
    @repository.new_instance
  end
end