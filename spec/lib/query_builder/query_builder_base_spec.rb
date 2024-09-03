# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QueryBuilderBase, type: :query_builder do
  describe '#initialize' do
    it 'should have a conditions hash' do
      expect(subject.instance_variable_get(:@conditions)).to eq({})
    end
  end

  describe '#with_id' do
    it 'should return self' do
      expect(subject.with_id(1)).to eq(subject)
    end
    it 'should set id in conditions' do
      expect(subject.with_id(1).build).to eq({ id: 1 })
    end
  end
  
end
