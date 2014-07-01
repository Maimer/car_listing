require 'rails_helper'

RSpec.describe Manufacturer, :type => :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:manufacturer)).to be_valid
  end

  it "is invalid without a manufacturer" do
    expect(FactoryGirl.build(:manufacturer, name: nil)).to_not be_valid
  end

  it "is invalid without a country" do
    expect(FactoryGirl.build(:manufacturer, country: nil)).to_not be_valid
  end

  it "won't add a duplicate manufacturer" do
    FactoryGirl.create(:manufacturer, name: 'Ford', country: 'USA')
    expect{ FactoryGirl.create(:manufacturer, name: 'Ford', country: 'USA') }
      .to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Name has already been taken')
    expect{ FactoryGirl.create(:manufacturer, name: 'Ford', country: 'Not USA') }
      .to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Name has already been taken')

    expect(Manufacturer.all.count).to eq(1)
  end
end
