# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BaseService, type: :service do
  context 'when BaseService is inherited' do
    class DummyBaseService < BaseService
    end

    subject { DummyBaseService.new }

    it 'raises NotImplementedError for create' do
      expect { subject.create }.to raise_error(NotImplementedError)
    end

    it 'raises NotImplementedError for update' do
      expect { subject.update }.to raise_error(NotImplementedError)
    end

    it 'raises NotImplementedError for destroy' do
      expect { subject.destroy }.to raise_error(NotImplementedError)
    end

    it 'raises NotImplementedError for find' do
      expect { subject.find }.to raise_error(NotImplementedError)
    end

    it 'raises NotImplementedError for all' do
      expect { subject.all }.to raise_error(NotImplementedError)
    end
  end
end
