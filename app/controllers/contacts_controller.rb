class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path, notice: 'Your message was successfully sent!'
    else
      errors = @contact.errors.full_messages
      redirect_to root_path, notice: errors
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end