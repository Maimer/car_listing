require 'rails_helper'

RSpec.describe Car, :type => :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:car)).to be_valid
  end

  it "is invalid without a color" do
    expect(FactoryGirl.build(:car, color: nil)).to_not be_valid
  end

  it "is invalid without mileage" do
    expect(FactoryGirl.build(:car, mileage: nil)).to_not be_valid
  end

  it "is invalid without a year" do
    expect(FactoryGirl.build(:car, year: nil)).to_not be_valid
  end

  it "is invalid without a description" do
    expect(FactoryGirl.build(:car, description: nil)).to be_valid
  end

  it "is invalid with a mileage below 0" do
    expect(FactoryGirl.build(:car, mileage: -1)).to_not be_valid
  end

  it "is invalid with a year lower than 1920 or higher than #{Time.now.year + 1}" do
    expect(FactoryGirl.build(:car, year: 1919)).to_not be_valid
    expect(FactoryGirl.build(:car, year: Time.now.year + 2)).to_not be_valid
  end
end
