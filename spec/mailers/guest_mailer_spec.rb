require "rails_helper"

RSpec.describe GuestMailer, type: :mailer do
  describe "welcome_email" do
    let(:mail) { GuestMailer.welcome_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Seja bem vindo")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("seja bem vindo")
    end
  end

end
