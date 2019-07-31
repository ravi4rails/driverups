class ContactMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_email(contact)
    @contact = contact
    @email = @contact.email
    mail(to: @email, subject: 'Thank you for contacting us')
  end

end
