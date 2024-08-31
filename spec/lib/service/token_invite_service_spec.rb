# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TokenInviteService, type: :service do
  describe '#generate_token' do
    it 'returns a string with 20 characters' do
      expect(described_class.generate_token.length).to eq(36)
    end
  end
end
