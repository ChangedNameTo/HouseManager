# == Schema Information
#
# Table name: late_plates
#
#  id              :integer          not null, primary key
#  day             :date             not null
#  completed       :boolean          default(FALSE), not null
#  meal_id         :integer          not null
#  user_id         :integer          not null
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'
require Rails.root.join('spec', 'models', 'shared_examples', 'non_null_field.rb')

describe LatePlate do
  it 'has a valid factory' do
    expect(build(:late_plate)).to be_valid
  end

  describe 'day', field: :day do
    it_behaves_like 'non null field'
  end

  describe 'completed', field: :completed do
    it_behaves_like 'non null field'
  end

  describe 'meal_id', field: :meal_id do
    it_behaves_like 'non null field'
  end

  describe 'user_id', field: :user_id do
    it_behaves_like 'non null field'
  end

	describe 'requester_name' do
    let(:user) { build(:user,
      first_name: "Will",
      last_name: "Mitchell"
    ) }

    let(:late_plate) { build(:late_plate,
      user_id: :user
    ) }

    it "returns the requesters full name as a string" do
      expect(late_plate.user_id).to eq "Will Mitchell"
    end
  end

  describe "meal_name" do
    it "returns the meal's name as a string" do
      let(:meal) { build(:meal,
        name: "Lunch"
      ) }

      let(:late_plate) { build(:late_plate,
        meal_id: meal
      ) }

      expect(late_plate.meal_name).to eq "Lunch"
    end
  end
end
