require 'rails_helper'

RSpec.describe Invitation, type: :model do
  context 'associations' do
    it { should belong_to(:company) }
    it { should belong_to(:user) }
  end
end
