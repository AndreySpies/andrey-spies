require 'twilio-ruby'

class SmsAlertJob < ApplicationJob
  queue_as :default

  def perform(contact_id)
    contact = Contact.find(contact_id)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+5519933007128'
    to = '+5551985526133'

    client.messages.create(
      from: from,
      to: to,
      body: "Hey Andrey, we have a new contact 😎, #{contact.name} sent you a message:\n\n#{contact.message}\n\nClick below to answer:\n mailto:#{contact.email}"
    )
  end
end
