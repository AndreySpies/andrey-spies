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
    SmsAlertJob.perform_later(id)
  end
end
