require 'rails_helper'

RSpec.describe ManufacturersController, :type => :controller do

  describe "GET #index" do
    it "assigns @manufacturers" do
      manufacturer = FactoryGirl.create(:manufacturer)
      manufacturer2 = FactoryGirl.create(:manufacturer)
      get :index
      expect(assigns(:manufacturers)).to eq([manufacturer, manufacturer2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested contact to @manufacturer" do
      manufacturer = FactoryGirl.create(:manufacturer)
      get :show, id: manufacturer
      expect(assigns(:manufacturer)).to eq(manufacturer)
    end
    it "renders the :show template" do
      manufacturer = FactoryGirl.create(:manufacturer)
      get :show, id: FactoryGirl.create(:manufacturer)
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new manufacturer to @manufacturer" do
      manufacturer = Manufacturer.new
      get :new
      expect(assigns(:manufacturer).attributes).to eq(manufacturer.attributes)
    end
    it "renders the :new template" do
      manufacturer = Manufacturer.new
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new manufacturer in the database" do
        expect{ post :create, manufacturer: FactoryGirl.build(:manufacturer).attributes }
          .to change(Manufacturer, :count).by(1)
      end
      it "redirects to the home page" do
        post :create, manufacturer: FactoryGirl.build(:manufacturer).attributes
        expect(response).to redirect_to Manufacturer.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new manufacturer in the database" do
        expect{ post :create, manufacturer: FactoryGirl.build(:manufacturer, name: nil).attributes }
          .to_not change(Manufacturer, :count)
      end
      it "re-renders the :new template" do
        post :create, manufacturer: FactoryGirl.build(:manufacturer, name: nil).attributes
        expect(response).to render_template :new
      end
    end
  end
end
