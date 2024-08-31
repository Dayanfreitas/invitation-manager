# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersService, type: :service do
  describe "#find_by_email" do
    context "when user is found" do
      it "should return object User" do
        user = create(:user)

        expect(UsersService.new(UsersRepository.new).find_by_email(user.email)).to eq(user)
      end
    end
    context 'when user is not found' do
      it 'should return nil' do
        expect(UsersService.new(UsersRepository.new).find_by_email("")).to eq(nil)
      end
    end
  end

  describe '#find_or_create_user' do
    context 'when user is found' do
      it 'should return object User' do
        user = create(:user)

        expect(UsersService.new(UsersRepository.new).find_or_create_user(user.email)).to eq(user)
      end
      it 'should return object User valid' do
        user = create(:user)

        expect(UsersService.new(UsersRepository.new).find_or_create_user(user.email).valid?).to eq(true)
      end
    end
    context 'when user is not found' do
      it 'should return object User' do
        user = build(:user)

        expect(UsersService.new(UsersRepository.new).find_or_create_user(user.email)).to be_a(User)
      end
      it 'should return object User valid' do
        user = build(:user)

        expect(UsersService.new(UsersRepository.new).find_or_create_user(user.email).valid?).to eq(true)
      end
    end
  end
end
