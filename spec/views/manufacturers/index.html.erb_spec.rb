require 'rails_helper'

RSpec.describe "manufacturers/index", :type => :view do

  before(:each) do
    @manufacturer1 = FactoryGirl.create(:manufacturer)
    @manufacturer2 = FactoryGirl.create(:manufacturer)
    assign(:manufacturers, [@manufacturer1, @manufacturer2])
  end

  it "displays all the manufacturers" do
    render

    expect(rendered).to have_content(@manufacturer1.name)
    expect(rendered).to have_content(@manufacturer1.country)
    expect(rendered).to have_content(@manufacturer2.name)
    expect(rendered).to have_content(@manufacturer2.country)
  end

  it "contains links to each manufacturer's show page" do
    render

    expect(rendered).to have_link(@manufacturer1.name, manufacturer_path(@manufacturer1))
    expect(rendered).to have_link(@manufacturer2.name, manufacturer_path(@manufacturer2))
  end
end
