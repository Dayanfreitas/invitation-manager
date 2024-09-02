class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :invitation, dependent: :destroy

  def company
    Company.last
  end
end
