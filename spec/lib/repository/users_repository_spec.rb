# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersRepository, type: :repository do
  describe '#initialize' do
    context 'when initialize' do
      subject { UsersRepository.new }
      
      it 'should equals' do
        expect(subject).to be_a(UsersRepository)
      end
      it 'extends BaseRepository' do
        expect(subject).to be_a(BaseRepository)
      end
      it 'has a User class' do
        expect(subject.model).to eq(User)
      end
    end
  end

  describe '#create' do
    context 'when user is created' do
      subject { UsersRepository.new }

      it 'should return the user object' do
        user = subject.create(attributes: build(:user).attributes)

        expect(user).to be_a(User)
      end
      it 'should must persisted a new user' do 
        attributes = build(:user).attributes
        attributes['password'] = Faker::Internet.password

        user = subject.create(attributes: attributes)

        expect(user).to be_persisted
      end
    end
    
    context 'when user is not created' do
      subject { UsersRepository.new }

      it 'should not persist user' do
        attributes = build(:user).attributes
        attributes['email'] = nil

        user = subject.create(attributes: attributes)

        expect(user).not_to be_persisted
      end
    end
  end

  describe '#update' do
    context 'when user is updated' do
      subject { UsersRepository.new }

      it 'should return updated true' do
        user = create(:user)

        updated = subject.update(id: user.id, attributes: { email: Faker::Internet.email, password: Faker::Internet.password })
        
        expect(updated).to be_truthy
      end
    end

    context 'when user is not updated' do
      subject { UsersRepository.new }

      it 'should return updated false' do
        user = create(:user)

        updated = subject.update(id: user.id, attributes: { email: nil, password: Faker::Internet.password })

        expect(updated).to be_falsey
      end
    end
  end

  describe '#destroy' do
    context 'when user is destroyed' do
      it 'should return destroyed true' do
        subject { UsersRepository.new }
        
        user = create(:user)

        expect(subject.destroy(user.id)).to be_truthy
      end
    end
    context 'when user is not destroyed' do
      it 'should return destroyed false' do
        subject { UsersRepository.new }

        expect(subject.destroy(0)).to be_falsey
      end
    end
  end

  describe '#find' do
    context 'when user exists' do 
      subject { UsersRepository.new }

      it 'should return the user object' do
        user = create(:user)

        expect(subject.find(user.id)).to be_a(User)
      end
      it 'should return saved user' do
        user = create(:user)

        expect(subject.find(user.id)).to eq(user)
      end
    end
    context  'when user does not exist' do
      subject { UsersRepository.new }

      it 'should return nil' do
        expect(subject.find(1)).to be_nil
      end
    end
  end
  
end
