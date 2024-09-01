# Preview all emails at http://localhost:3000/rails/mailers/guest_mailer
class GuestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/guest_mailer/welcome_email
  def welcome_email
    GuestMailer.welcome_email
  end

end
