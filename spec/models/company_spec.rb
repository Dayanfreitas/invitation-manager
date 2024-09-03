require 'rails_helper'

RSpec.describe Company, type: :model do
  before do
    create(:company) 
  end
  
  context 'associations' do
    it { should have_many(:invitations).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
