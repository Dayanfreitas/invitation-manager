class UsersService < BaseService
  def initialize(repository)
    super(repository)
  end

  def find_or_create_user(email)
    user = find_by_email(email)
    
    return user if user.present?

    attributes = {
      email: email,
      password: SecureRandom.hex(10)
    }

    @repository.create(attributes: attributes)
  end

  def find_by_email(email)
    @repository.find_by_email(email)
  end

    
  class Guest
    # TODO: Implement the Guest class
    def initialize(user:)
      @user = user
    end
    
    def build
      @user = @user.dup
      # @user.token_invite = SecureRandom.hex
      @user.attributes
    end
  end

  class Admin
    # TODO: Implement the Admin class

    def initialize(user:)
      @user = user
    end

    def build
      @user = @user.dup
      # @user.admin = 'admin'
      @user.attributes
    end
  end
end
  