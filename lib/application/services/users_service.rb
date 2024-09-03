class UsersService < BaseService
  def initialize(repository)
    super(repository)
  end

  def get_all(filter: {})
    @repository.all
  end
  
  def create(attributes:)
    @repository.create(attributes: attributes)
  end
  
  def update(id:, attributes:)
    @repository.update(id: id, attributes: attributes)
  end

  def find(id)
    @repository.find(id)
  end
  
  def destroy(id)
    @repository.destroy(id)
  end

  def create_admin(attributes:)
    user_admin = Admin.new(attributes: attributes).build
    @repository.create(attributes: user_admin)
  end

  def find_or_create_user(email)
    user = find_by_email(email)
    
    return user if user.present?

    attributes = {
      email: email,
      password: SecureRandom.hex(10)
    }

    create(attributes: attributes) 
  end

  def find_by_email(email)
    @repository.find_by_email(email)
  end

  def new_instance
    @repository.model.new(
      Admin.new.build
    )
  end
  
  class Guest
    def initialize(attributes: {})
      @attributes = attributes
    end

    def build
      @attributes
    end
  end

  class Admin
    def initialize(attributes: {})
      @attributes = attributes
    end

    def build
      @attributes
    end
  end
end
  