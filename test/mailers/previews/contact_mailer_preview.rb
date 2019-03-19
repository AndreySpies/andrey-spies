# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/confirmation
  def confirmation
    contact = Contact.first
    ContactMailer.confirmation(contact)
  end

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/new_contact
  def new_contact
    ContactMailer.new_contact
  end

end
