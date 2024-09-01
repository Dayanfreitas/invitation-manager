class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  def base_url
    "http://localhost:3000"
  end
end
