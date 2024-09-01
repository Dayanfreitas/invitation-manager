# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InviteService, type: :service do
  subject { InviteService.new(InvitationRepository.new) }

  describe "#create_invitation" do
    context 'when user is found' do
      it 'should return object Invitation' do
        user = create(:user)
        company = create(:company)
        
        expect(subject.create_invitation(email: user.email, company_id: company.id)).to be_a(Invitation)
      end
    end
    context 'when user is not found' do
      it 'should return object Invitation' do
        user = build(:user)
        company = create(:company)

        expect(subject.create_invitation(email: user.email, company_id: company.id)).to be_a(Invitation)
      end
    end
    context 'when email invalid' do
      it 'should return false' do
        expect(subject.create_invitation(email: "", company_id: 1)).to be_falsey
      end
    end
  end

  describe '#create' do
    context 'when attributes is valid' do
      it 'should return object Invitation' do
        invitation = build(:invitation)

        expect(subject.create(attributes: invitation.attributes)).to be_a(Invitation)
      end
    end
    context 'when attributes is invalid' do
      it 'should return object Invitation' do
        invitation = build(:invitation, company: nil)

        expect(subject.create(attributes: invitation.attributes)).to be_falsey
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

  describe "#find_invitation_by_token_sent" do
    context "when invitation is found" do
      it "should return object Invitation" do
        invitation = create(:invitation, status: Invitation::Status::SENT)
  
        expect(subject.find_invitation_by_token_sent(invitation.token)).to eq(invitation)
      end
    end
    context "when invitation is not found" do
      it "should return nil" do
        expect(subject.find_invitation_by_token_sent("")).to eq(nil)
      end
    end
  end
end
