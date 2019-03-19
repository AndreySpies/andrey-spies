class Contact < ApplicationRecord
  after_create :send_confirmation_email

  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true

  private

  def send_confirmation_email
    ContactMailer.confirmation(self).deliver_now
  end
end
