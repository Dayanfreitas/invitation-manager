# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TokenInviteService, type: :service do
  describe '#generate_token' do
    it 'returns a string with 20 characters' do
      expect(described_class.generate_token.length).to eq(36)
    end
  end

  describe '#valid_token_sent?' do
    context 'when token is valid' do
      let(:invitation) { create(:invitation, status: Invitation::Status::SENT) }
      let(:token) { invitation.token }

      it 'returns the invitation' do
        expect(described_class.new.valid_token_sent?(token)).to eq(invitation)
      end
    end
    context 'when token not sent' do
      let(:invitation) { create(:invitation, status: Invitation::Status::PENDING) }
      let(:token) { invitation.token }

      it 'returns false' do
        expect(described_class.new.valid_token_sent?(token)).to eq(false)
      end
    end
    context 'when token is invalid' do
      let(:token) { nil }

      it 'returns false' do
        expect(described_class.new.valid_token_sent?(token)).to eq(false)
      end
    end
  end

end
