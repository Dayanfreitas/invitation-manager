require 'rails_helper'

RSpec.describe Invitation, type: :model do
  context 'associations' do
    it { should belong_to(:company) }
    it { should belong_to(:user) }
  end

  describe ".token" do
    it "should return a token" do
      expect(Invitation.token).to be_kind_of(String)
    end
  end
end
