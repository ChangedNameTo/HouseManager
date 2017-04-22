require 'rails_helper'

describe Role do
  it "has a valid factory" do
    expect(build(:role)).to be_valid
  end

  it "is invalid without a label" do
    expect(build(:role, label: nil)).not_to be_valid
  end

  it "is invalid without a unique label" do
    role = create(:role)

    expect(build(:role, label: role.label)).not_to be_valid
  end

  it "is invalid without a description" do
    expect(build(:role, description: nil)).not_to be_valid
  end
end
