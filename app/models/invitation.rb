class Invitation < ApplicationRecord
  module Status
    PENDING = 'pending'
  end
  
  belongs_to :company
  belongs_to :user

  validates :company, presence: true
  validates :user, presence: true
  validates :status, presence: true
  validates :token, presence: true, uniqueness: true
end
