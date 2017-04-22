# == Schema Information
#
# Table name: meals
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  time            :time             not null
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'
require Rails.root.join('spec', 'models', 'shared_examples', 'non_null_field.rb')

describe Meal do
  it 'has a valid factory' do
    expect(build(:meal)).to be_valid
  end

  describe 'name', field: :name do
    it_behaves_like 'non null field'
  end

  describe 'time', field: :time do
    it_behaves_like 'non null field'
  end

  describe "#meal_name" do
    let(:organization) { FactoryGirl.create :organization }

    let(:meal) { build(:meal,
      name: "Lunch",
      time: "11:00:00",
      organization_id: organization
    ) }

    it "returns the meal's name as a string" do
      expect(meal.meal_name).to eq "Lunch at 11:00 AM"
    end
  end

  describe "#short_time" do
    let(:organization) { FactoryGirl.create :organization }

    let(:meal) { build(:meal,
      name: "Lunch",
      time: "11:00:00",
      organization_id: organization
    ) }

    it "returns the meal's name as a string" do
      expect(meal.short_time).to eq "11:00 AM"
    end
  end
end
