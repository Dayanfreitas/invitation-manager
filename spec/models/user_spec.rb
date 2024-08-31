require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }
    it { should respond_to(:email) }
  end

  describe 'when email is not present' do
    subject { build(:user, email: ' ')}
    it { should_not be_valid }
  end
end
