# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InviteQueryBuilder, type: :query_build do
  describe '#with_user_id' do
    it 'should return self' do
      expect(subject.with_user_id(1)).to eq(subject)
    end
    it 'should set user_id in conditions' do
      expect(subject.with_user_id(1).build).to eq({ user_id: 1 })
    end
  end

  describe '#with_company_id' do
    it 'should return self' do
      expect(subject.with_company_id(1)).to eq(subject)
    end
    it 'should set company_id in conditions' do
      expect(subject.with_company_id(1).build).to eq({ company_id: 1 })
    end
  end  

  describe '#with_token' do
    it 'should return self' do
      expect(subject.with_token('token')).to eq(subject)
    end
    it 'should set token in conditions' do
      expect(subject.with_token('token').build).to eq({ token: 'token' })
    end
  end

  describe '#with_status' do
    it 'should return ' do
      expect(subject.with_status(Invitation::Status::PENDING)).to eq(subject)
    end
    it 'should set status in conditions' do
      expect(subject.with_status(Invitation::Status::PENDING).build).to eq({ status: Invitation::Status::PENDING })
    end
  end
end
