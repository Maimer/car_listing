require 'rails_helper'

feature 'user adds a new manufacturer', %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

  before(:each) do
    @manufacturer = FactoryGirl.build(:manufacturer)
    visit new_manufacturer_path
  end

  scenario 'user adds a new manufacturer' do
    fill_in 'Name', with: @manufacturer.name
    fill_in 'Country', with: @manufacturer.country
    click_on 'Create Manufacturer'

    expect(page).to have_content @manufacturer.name
    expect(page).to have_content @manufacturer.country
    expect(page).to have_link("Add a New Car", new_manufacturer_car_path(@manufacturer))
  end

  scenario 'user leaves manufacturer name blank' do
    fill_in 'Country', with: @manufacturer.country
    click_on 'Create Manufacturer'

    expect(page).to have_content "Your Manufacturer was not succesfully submitted."
  end

  scenario 'user leaves country blank' do
    fill_in 'Name', with: @manufacturer.name
    click_on 'Create Manufacturer'

    expect(page).to have_content "Your Manufacturer was not succesfully submitted."
  end
end
