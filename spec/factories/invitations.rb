FactoryBot.define do
  factory :invitation do
    company { create(:company) }
    user { create(:user) }
    status { Invitation::Status::PENDING }
    invited_at { Time.now }
    token { TokenInviteService.generate_token }
  end
end
