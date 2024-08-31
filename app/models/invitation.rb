class Invitation < ApplicationRecord
  belongs_to :company
  belongs_to :user

  def self.token
    SecureRandom.uuid
  end
end
