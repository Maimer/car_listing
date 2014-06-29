require 'rails_helper'

RSpec.describe CarsController, :type => :controller do

  describe "GET #new" do
    it "assigns a new car to @car" do
      car = Car.new
      get :new, manufacturer_id: :id
      expect(assigns(:car).attributes).to eq(car.attributes)
    end
    it "renders the :new template" do
      car = Car.new
      get :new, manufacturer_id: :id
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new car in the database" do
        expect{ post :create, manufacturer_id: :id, car: FactoryGirl.build(:car).attributes }
          .to change(Car, :count).by(1)
      end
      it "redirects to the manufacturer page" do
        post :create, manufacturer_id: :id, car: FactoryGirl.build(:car).attributes
        expect(response).to redirect_to Car.last.manufacturer
      end
    end

    context "with invalid attributes" do
      it "does not save the new car in the database with no color" do
        expect{ post :create, manufacturer_id: :id, car: FactoryGirl.build(:car, color: nil).attributes }
          .to_not change(Car, :count)
      end
      it "does not save the new car in the database with no mileage" do
        expect{ post :create, manufacturer_id: :id, car: FactoryGirl.build(:car, mileage: nil).attributes }
          .to_not change(Car, :count)
      end
      it "does not save the new car in the database with no year" do
        expect{ post :create, manufacturer_id: :id, car: FactoryGirl.build(:car, year: nil).attributes }
          .to_not change(Car, :count)
      end
      it "does not save the new car in the database with too low a year" do
        expect{ post :create, manufacturer_id: :id, car: FactoryGirl.build(:car, year: 1919).attributes }
          .to_not change(Car, :count)
      end
      it "does not save the new car in the database with too high a year" do
        expect{ post :create, manufacturer_id: :id, car: FactoryGirl.build(:car, year: 2016).attributes }
          .to_not change(Car, :count)
      end
      it "re-renders the :new template" do
        post :create, manufacturer_id: :id, car: FactoryGirl.build(:car, color: nil).attributes
        expect(response).to render_template :new
      end
    end
  end
end
