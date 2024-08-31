# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InviteService, type: :service do
  subject { InviteService.new(InvitationRepository.new) }

  describe "#create_invitation" do
    context 'when user is found' do
      it 'should return object Invitation' do
        user = create(:user)

        expect(subject.create_invitation(email: user.email, company_id: 1)).to be_a(Invitation)
      end
    end
    context 'when user is not found' do
      it 'should return object Invitation' do
        user = build(:user)

        expect(subject.create_invitation(email: user.email, company_id: 1)).to be_a(Invitation)
      end
    end
    context 'when email invalid' do
      it 'should return false' do
        expect(subject.create_invitation(email: "", company_id: 1)).to be_falsey
      end
    end
  end

  describe "#search_users_by_email" do
    context "when user is found" do
      it "should return object User" do
        user = create(:user)
  
        expect(subject.search_users_by_email(user.email)).to eq(user)
      end
    end
    context "when user is not found" do
      it "should return nil" do
        expect(subject.search_users_by_email("")).to eq(nil)
      end
    end
  end

  describe "#send_invitation" do
    it "should raise NotImplementedError" do
      expect { subject.send_invitation }.to raise_error(NotImplementedError)
    end
  end
end
