require 'rails_helper'

RSpec.describe Invitation, type: :model do
  before do
    create(:invitation) 
  end
  
  context 'associations' do
    it { should belong_to(:company) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:token) }
    it { should validate_uniqueness_of(:token) }
  end

  describe 'constants' do
    it 'has a PENDING status' do
      expect(Invitation::Status::PENDING).to eq('pending')
    end
  end
end
