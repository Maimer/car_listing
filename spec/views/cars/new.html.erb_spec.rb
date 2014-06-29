require 'rails_helper'

RSpec.describe "cars/new", :type => :view do

  before(:each) do
    render
  end

  it 'displays a form to create a car' do
    expect(rendered).to have_button('Create Car')
  end

  it 'displays a field to enter a color' do
    expect(rendered).to have_field('Color')
  end

  it 'displays a field to enter a mileage' do
    expect(rendered).to have_field('Mileage')
  end

  it 'displays a field to enter a year' do
    expect(rendered).to have_field('Year')
  end

  it 'displays a field to enter a description' do
    expect(rendered).to have_field('Description')
  end
end
