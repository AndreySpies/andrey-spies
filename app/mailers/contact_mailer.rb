class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.confirmation.subject
  #
  def confirmation(contact)
    @contact = contact
    attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")
    mail(to: @contact.email, subject: 'Confirmation Message')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.new_contact.subject
  #
  def new_contact
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
