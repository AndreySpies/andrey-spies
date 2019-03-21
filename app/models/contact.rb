require 'twilio-ruby'

class Contact < ApplicationRecord
  after_create :send_confirmation_email, :send_alert_email #, :send_sms_alert

  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true

  private

  def send_confirmation_email
    ContactMailer.confirmation(self).deliver_later
  end

  def send_alert_email
    ContactMailer.new_contact(self).deliver_later
  end

  def send_sms_alert
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+5519933007128'
    to = '+5551985526133'

    client.messages.create(
      from: from,
      to: to,
      body: "Hey Andrey, we have a new contact 😎, #{name} sent you a message:\n\n#{message}\n\nClick below to answer:\n mailto:#{email}"
    )
  end
end
