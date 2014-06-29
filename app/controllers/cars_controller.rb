class CarsController < ApplicationController

  def new
    @car = Car.new
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
  end

  def create
    @car = Car.new(car_params)
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @car.manufacturer_id = @manufacturer.id

    if @car.save
      redirect_to @manufacturer
    else
      flash.now[:notice] = "Your Car was not succesfully submitted."
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description)
  end
end
