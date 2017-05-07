# == Schema Information
#
# Table name: announcements
#
#  id              :integer          not null, primary key
#  title           :string           not null
#  body            :string           not null
#  author_id       :integer          not null
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

describe Announcement do
  subject { build(:announcement) }

  it {should be_valid}
  it {should validate_presence_of :title }
  it {should validate_presence_of :body }
  it {should validate_presence_of :author_id }
  it {should validate_presence_of :organization_id }

  it {should belong_to :user}
  it {should belong_to :organization}

  describe '#send_new_announcement_email' do
    it 'sends an email to every member of the organization' do
      message_delivery = instance_double(ActionMailer::MessageDelivery)

      expect(NotificationMailer).to receive(:new_announcement_email)
        .and_return(message_delivery)

      expect(message_delivery).to receive(:deliver_later)

      create(:announcement)
    end
  end

end
