class Invitation < ApplicationRecord
  module Status
    PENDING = 'pending'
  end
  
  belongs_to :company
  belongs_to :user

  validates :status, presence: true
  def self.token
    SecureRandom.uuid
  end
end
