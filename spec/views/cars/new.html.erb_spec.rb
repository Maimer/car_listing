require 'rails_helper'

RSpec.describe "cars/new", :type => :view do

  before(:each) do
    @manufacturer = FactoryGirl.create(:manufacturer)
    @car = Car.new
  end

  it 'displays a form to create a car' do
    render
    expect(rendered).to have_button('Create Car')
  end

  it 'displays a field to enter a color' do
    render
    expect(rendered).to have_field('Color')
  end

  it 'displays a field to enter a mileage' do
    render
    expect(rendered).to have_field('Mileage')
  end

  it 'displays a field to enter a year' do
    render
    expect(rendered).to have_field('Year')
  end

  it 'displays a field to enter a description' do
    render
    expect(rendered).to have_field('Description')
  end
end
