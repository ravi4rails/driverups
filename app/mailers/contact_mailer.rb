class ContactMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_email(contact)
    @contact = contact
    @email = @contact.email
    mail(to: @email, subject: 'Thank you for contacting us')
  end
  
  def booking_email(email) 
    @email = email
    mail(to: @email, subject: 'Your booking has been confirmed')
  end 

end
