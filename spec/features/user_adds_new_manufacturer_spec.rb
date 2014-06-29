require 'rails_helper'

feature 'user adds a new manufacturer', %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

  before(:each) do
    visit new_manufacturer_path
    @manufacturer = FactoryGirl.build(:manufacturer)
  end

  scenario 'user adds a new manufacturer' do
    fill_in 'Name', with: @manufacturer.name
    select @manufacturer.country, from: 'Country'
    click_on 'Create Manufacturer'

    expect(page).to have_content @manufacturer.name
    expect(page).to have_content @manufacturer.country
    expect(page).to have_content "Add a new Car"
  end

  scenario 'user leaves manufacturer name blank' do
    select @manufacturer.country, from: 'Country'
    click_on 'Create Manufacturer'

    expect(page).to have_content "Your Manufacturer was not succesfully submitted."
  end

  scenario 'user leaves country blank' do
    fill_in 'Name', with: @manufacturer.name
    click_on 'Create Manufacturer'

    expect(page).to have_content "Your Manufacturer was not succesfully submitted."
  end

  scenario 'user adds a manufacturer with a duplicate name' do
    @manufacturer.save
    fill_in 'Name', with: @manufacturer.name
    select @manufacturer.country, from: 'Country'
    click_on 'Create Manufacturer'

    expect(page).to have_content "Your Manufacturer was not succesfully submitted."
  end
end
