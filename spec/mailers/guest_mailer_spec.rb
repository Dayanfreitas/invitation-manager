require "rails_helper"

RSpec.describe GuestMailer, type: :mailer do
  describe "welcome_email" do

    subject { 
      invitation = double("invitation", token: "token")
      GuestMailer.welcome_email(invitation: invitation) 
    }

    it "renders the headers" do
      expect(subject.subject).to eq("Seja bem vindo")
      expect(subject.to).to eq(["to@example.org"])
      expect(subject.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(subject.body.encoded).to match("seja bem vindo")
    end
  end

end
