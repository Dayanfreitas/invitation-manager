# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InvitationRepository, type: :repository do
  describe '#initialize' do
    context 'when initialize' do
      subject { InvitationRepository.new }
      
      it 'should equals' do
        expect(subject).to be_a(InvitationRepository)
      end
      it 'extends BaseRepository' do
        expect(subject).to be_a(BaseRepository)
      end
      it 'has a Invitation class' do
        expect(subject.model).to eq(Invitation)
      end
    end
  end

  describe '#create' do
    context 'when object is created' do
      subject { InvitationRepository.new }

      it 'should return the object' do
        object = subject.create(attributes: build(:invitation).attributes)

        expect(object).to be_a(Invitation)
      end
      it 'should must persisted a new object' do 
        attributes = build(:invitation).attributes
        
        object = subject.create(attributes: attributes)
        expect(object).to be_persisted
      end
    end
    
    context 'when object is not created' do
      subject { InvitationRepository.new }

      it 'should not persist object' do
        attributes = build(:invitation).attributes
        attributes['company_id'] = nil
        
        object = subject.create(attributes: attributes)

        expect(object).not_to be_persisted
      end
    end
  end

  describe '#update' do
    context 'when object is updated' do
      subject { InvitationRepository.new }

      it 'should return updated true' do
        object = create(:invitation)

        updated = subject.update(id: object.id, attributes: { status: 'accepted'})
        
        expect(updated).to be_truthy
      end
    end

    context 'when object is not updated' do
      subject { InvitationRepository.new }

      it 'should return updated false' do
        object = create(:invitation)

        updated = subject.update(id: object.id, attributes: { company_id: nil, user_id: nil })

        expect(updated).to be_falsey
      end
    end
  end

  describe '#destroy' do
    context 'when object is destroyed' do
      it 'should return destroyed true' do
        subject { InvitationRepository.new }
        
        object = create(:invitation)

        expect(subject.destroy(object.id)).to be_truthy
      end
    end
    context 'when object is not destroyed' do
      it 'should return destroyed false' do
        subject { InvitationRepository.new }

        expect(subject.destroy(0)).to be_falsey
      end
    end
  end

  describe '#find' do
    context 'when object exists' do 
      subject { InvitationRepository.new }

      it 'should return the object' do
        object = create(:invitation)

        expect(subject.find(object.id)).to be_a(Invitation)
      end
      it 'should return saved object' do
        object = create(:invitation)

        expect(subject.find(object.id)).to eq(object)
      end
    end
    context  'when object does not exist' do
      subject { InvitationRepository.new }

      it 'should return nil' do
        expect(subject.find(0)).to be_nil
      end
    end
  end
  
end
