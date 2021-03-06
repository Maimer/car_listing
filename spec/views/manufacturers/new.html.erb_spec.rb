require 'rails_helper'

RSpec.describe "manufacturers/new", :type => :view do

  before(:each) do
    @manufacturer = Manufacturer.new
  end

  it 'displays a form to create a manufacturer' do
    render
    expect(rendered).to have_button('Create Manufacturer')
  end

  it 'displays a field to enter a name' do
    render
    expect(rendered).to have_field('Name')
  end

  it 'displays a field to enter a country' do
    render
    expect(rendered).to have_field('Country')
  end
end
