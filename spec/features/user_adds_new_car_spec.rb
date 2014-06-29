require 'rails_helper'

feature 'user adds a new car', %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

  before(:each) do
    @car = FactoryGirl.build(:car)
    visit new_manufacturer_car_path(@car.manufacturer)
  end

  scenario "user adds a new car" do
    fill_in 'Color', with: @car.color
    fill_in 'Mileage', with: @car.mileage
    fill_in 'Year', with: @car.year
    fill_in 'Description', with: @car.description
    click_on 'Create Car'

    expect(page).to have_content(@car.id, @car.color, @car.mileage, @car.year, @car.description)
    expect(page).to have_content(@car.manufacturer.name, @car.manufacturer.country)
    expect(page).to have_link("Add a New Car", new_manufacturer_car_path(@manufacturer))
  end

  scenario "user leaves color blank" do
    fill_in 'Mileage', with: @car.mileage
    fill_in 'Year', with: @car.year
    fill_in 'Description', with: @car.description
    click_on 'Create Car'

    expect(page).to have_content("Your Car was not succesfully submitted.")
  end

  scenario "user leaves mileage blank" do
    fill_in 'Color', with: @car.color
    fill_in 'Year', with: @car.year
    fill_in 'Description', with: @car.description
    click_on 'Create Car'

    expect(page).to have_content("Your Car was not succesfully submitted.")
  end

  scenario "user leaves year blank" do
    fill_in 'Color', with: @car.color
    fill_in 'Mileage', with: @car.mileage
    fill_in 'Description', with: @car.description
    click_on 'Create Car'

    expect(page).to have_content("Your Car was not succesfully submitted.")
  end

  scenario "user leaves description blank" do
    fill_in 'Color', with: @car.color
    fill_in 'Mileage', with: @car.mileage
    fill_in 'Year', with: @car.year
    click_on 'Create Car'

    expect(page).to have_content(@car.id, @car.color, @car.mileage, @car.year, @car.description)
    expect(page).to have_content(@car.manufacturer.name, @car.manufacturer.country)
    expect(page).to have_link("Add a New Car", new_manufacturer_car_path(@manufacturer))
  end

  scenario "user enters a year that is too low" do
    fill_in 'Color', with: @car.color
    fill_in 'Mileage', with: @car.mileage
    fill_in 'Year', with: "1919"
    fill_in 'Description', with: @car.description
    click_on 'Create Car'

    expect(page).to have_content("Your Car was not succesfully submitted.")
  end

  scenario "user enters a year that is too high" do
    fill_in 'Color', with: @car.color
    fill_in 'Mileage', with: @car.mileage
    fill_in 'Year', with: "#{Time.now.year + 2}"
    fill_in 'Description', with: @car.description
    click_on 'Create Car'

    expect(page).to have_content("Your Car was not succesfully submitted.")
  end

  scenario "user enters mileage that is negative" do
    fill_in 'Color', with: @car.color
    fill_in 'Mileage', with: "-1"
    fill_in 'Year', with: @car.year
    fill_in 'Description', with: @car.description
    click_on 'Create Car'

    expect(page).to have_content("Your Car was not succesfully submitted.")
  end
end
