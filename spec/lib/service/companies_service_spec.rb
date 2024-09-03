# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CompaniesService, type: :service do
  subject { CompaniesService.new(CompaniesRepository.new) }

  describe '#create' do 
    context 'when attributes is valid' do
      it 'should return object Company' do
        company = build(:company)

        expect(subject.create(attributes: company.attributes)).to be_a(Company)
      end
    end
  end

  describe '#update' do
    context 'when attributes is valid' do
      it 'should return updated true' do
        company = create(:company)

        expect(subject.update(id: company.id, attributes: { name: 'new name'})).to be_truthy
      end
    end
    context 'when attributes is invalid' do
      it 'should return updated false' do
        company = create(:company)

        expect(subject.update(id: company.id, attributes: { name: nil})).to be_falsey
      end
    end
  end

  describe '#find' do
    context 'when object exists' do
      it 'should return the object' do
        company = create(:company)

        expect(subject.find(company.id)).to eq(company)
      end
    end
  end
  
describe '#destroy' do
    context 'when object is destroyed' do
      it 'should return true' do
        company = create(:company)

        expect(subject.destroy(company.id)).to be_truthy
      end
    end
  end

 
    
end
