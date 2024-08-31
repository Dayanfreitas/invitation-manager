FactoryBot.define do
  factory :invitation do
    company { build(:company) }
    user { build(:user) }
    status { "MyString" }
    invited_at { "2024-08-31 14:06:31" }
  end
end
