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
    it 'has a SENT status' do
      expect(Invitation::Status::SENT).to eq('sent')
    end
    it 'has a ACCEPTED status' do
      expect(Invitation::Status::ACCEPTED).to eq('accepted')
    end
    it 'has a CANCELED status' do
      expect(Invitation::Status::CANCELED).to eq('canceled')
    end
  end

  describe '#sent!' do
    it 'updates the status to sent' do
      invitation = create(:invitation)
      invitation.sent!
      expect(invitation.status).to eq(Invitation::Status::SENT)
    end
  end

  describe '#accepted!' do
    it 'updates the status to accepted' do
      invitation = create(:invitation)
      invitation.accepted!
      expect(invitation.status).to eq(Invitation::Status::ACCEPTED)
    end
  end

  describe '#canceled!' do
    it 'updates the status to canceled' do
      invitation = create(:invitation)
      invitation.canceled!
      expect(invitation.status).to eq(Invitation::Status::CANCELED)
    end
  end
end
