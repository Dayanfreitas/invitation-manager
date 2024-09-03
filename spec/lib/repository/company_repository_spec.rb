# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CompaniesRepository, type: :repository do
  describe '#initialize' do
    context 'when initialize' do
      subject { CompaniesRepository.new }
      
      it 'should equals' do
        expect(subject).to be_a(CompaniesRepository)
      end
      it 'extends BaseRepository' do
        expect(subject).to be_a(BaseRepository)
      end
      it 'has a Company class' do
        expect(subject.model).to eq(Company)
      end
    end
  end

  describe '#create' do
    context 'when object is created' do
      subject { CompaniesRepository.new }

      it 'should return the object' do
        object = subject.create(attributes: build(:company).attributes)

        expect(object).to be_a(Company)
      end
      it 'should must persisted a new object' do 
        attributes = build(:company).attributes
        
        object = subject.create(attributes: attributes)
        expect(object).to be_persisted
      end
    end
    
    context 'when object is not created' do
      subject { CompaniesRepository.new }

      it 'should not persist object' do
        attributes = build(:company).attributes
        attributes['name'] = nil
        
        object = subject.create(attributes: attributes)

        expect(object).not_to be_persisted
      end
    end
  end

  describe '#update' do
    context 'when object is updated' do
      subject { CompaniesRepository.new }

      it 'should return updated true' do
        object = create(:company)

        updated = subject.update(id: object.id, attributes: { name: 'new name'})
        
        expect(updated).to be_truthy
      end
    end

    context 'when object is not updated' do
      subject { CompaniesRepository.new }

      it 'should return updated false' do
        object = create(:company)

        updated = subject.update(id: object.id, attributes: { name: nil})

        expect(updated).to be_falsey
      end
    end
  end

  describe '#destroy' do
    context 'when object is destroyed' do
      it 'should return destroyed true' do
        subject { CompaniesRepository.new }
        
        object = create(:company)

        expect(subject.destroy(object.id)).to be_truthy
      end
    end
    context 'when object is not destroyed' do
      it 'should return destroyed false' do
        subject { CompaniesRepository.new }

        expect(subject.destroy(0)).to be_falsey
      end
    end
  end

  describe '#find' do
    context 'when object exists' do 
      subject { CompaniesRepository.new }

      it 'should return the object' do
        object = create(:company)

        expect(subject.find(object.id)).to be_a(Company)
      end
      it 'should return saved object' do
        object = create(:company)

        expect(subject.find(object.id)).to eq(object)
      end
    end
    context  'when object does not exist' do
      subject { CompaniesRepository.new }

      it 'should return nil' do
        expect(subject.find(0)).to be_nil
      end
    end
  end

  describe '#get_all' do
    context 'when there are objects' do
      subject { CompaniesRepository.new }

      it 'should return all objects' do
        create(:company)
        create(:company)
        create(:company)


        expect(subject.get_all.count).to eq(3)
      end
    end
    context 'when there are not objects' do
      subject { CompaniesRepository.new }

      it 'should return an empty array' do
        expect(subject.get_all.count).to eq(0)
      end
    end
  end
end
