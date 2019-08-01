class ContactsController < ApplicationController
 
 def new
  @contact = Contact.new
 end
 
 def create
  @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_email(@contact).deliver_now
      redirect_to root_url, notice: 'Contact was successfully created.'       
    end
 end

 def contact_params
  params.require(:contact).permit!
 end

end
