namespace :db do
  desc "Para popular a base"
  task :populate => :environment do
    FactoryBot.create(:user, email: "dayan.freitas@test.com", password: "123456")
    
    4.times do
      FactoryBot.create(:invitation)
    end
  end

  desc "Para limpar a base"
  task :clean => :environment do
    User.all.each do |user|
      user.destroy
    end

    Company.all.each do |company|
      company.destroy
    end

    Invitation.all.each do |invitation|
      invitation.destroy
    end
  end

end