class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :invitations, dependent: :destroy

  def company
    Company.last
  end
end
