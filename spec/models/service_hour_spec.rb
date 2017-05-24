require 'rails_helper'

describe ServiceHour do
  subject { build( :service_hour ) }

  it { should validate_presence_of :recipient_id }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :for }

  it { should belong_to :recipient }

  describe "#money_to_hours" do
    it "converts money at a rate of 1 hour per $15" do
      expect(build(:service_hour, money: 15).money_to_hours).to eq(1)
    end
  end

  describe "#hours_and_money" do
    it "adds up converted money and hours" do
      expect(build(:service_hour, money: 15, hours: 1).hours_and_money).to eq(2)
    end
  end
end
