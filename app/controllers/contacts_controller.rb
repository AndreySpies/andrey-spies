class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      respond_to do |format|
        format.html { rendirect_to root_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'pages/home' }
        format.js
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
