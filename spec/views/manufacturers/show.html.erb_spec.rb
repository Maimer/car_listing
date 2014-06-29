require 'rails_helper'

RSpec.describe "manufacturers/show", :type => :view do
  before(:each) do
    @manufacturer = FactoryGirl.create(:manufacturer)
    assign(:manufacturer, @manufacturer)
    @car1 = FactoryGirl.build(:car)
    @car1.manufacturer_id = @manufacturer.id
    @car1.save
    @car2 = FactoryGirl.build(:car)
    @car2.manufacturer_id = @manufacturer.id
    @car2.save
    assign(:cars, [@car1, @car2])
  end

  it "displays the correct manufacturer" do
    render

    expect(rendered).to have_content(@manufacturer.name)
    expect(rendered).to have_content(@manufacturer.country)
  end

  it "contains a list of all the manufacturer's cars" do
    render

    expect(rendered).to have_content(@car1.id, @car1.color, @car1.mileage, @car1.year, @car1.description)
    # expect(rendered).to have_content
  end

  it "contains a link to view all manufacturers" do
    render

    expect(rendered).to have_link("View All Manufacturers", manufacturers_path)
  end

  it "contains a link to add a new car for that manufacturer" do
    render

    expect(rendered).to have_link("Add a new Car", new_manufacturer_car_path(@manufacturer))
  end
end
