require 'rails_helper'

describe MaintenanceRequest do
  subject { build(:maintenance_request) }

  it {should be_valid}
  it {should validate_presence_of :issue_title }
  it {should validate_presence_of :description }
  it {should validate_presence_of :reporter_id }
  it {should validate_presence_of :organization_id }
  it {should validate_presence_of :priority_id }

  it {should belong_to :user}
  it {should belong_to :organization}
  it {should belong_to :maintenance_request_priority}
  it {should have_many :maintenance_request_comments}

  describe '#send_new_maintenance_request_email' do
    it 'sends an email to the house manager and organization manager' do
      message_delivery = instance_double(ActionMailer::MessageDelivery)

      expect(NotificationMailer).to receive(:new_maintenance_request_email)
        .and_return(message_delivery)

      expect(message_delivery).to receive(:deliver_later)

      create(:maintenance_request)
    end
  end
end
