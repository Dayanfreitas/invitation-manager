class Invitation < ApplicationRecord
  module Status
    PENDING = 'pending'
    SENT = 'sent'
    ACCEPTED = 'accepted'
    CANCELED = 'canceled'

  end
  
  belongs_to :company
  belongs_to :user

  validates :company, presence: true
  validates :user, presence: true
  validates :status, presence: true
  validates :token, presence: true, uniqueness: true

  def sent!
    update(status: Status::SENT)
  end

  def accepted!
    update(status: Status::ACCEPTED)
  end

  def canceled!
    update(status: Status::CANCELED)
  end
end
