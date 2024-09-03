class Company < ApplicationRecord
  validates :name, presence: true

  has_many :invitations, dependent: :destroy
end
