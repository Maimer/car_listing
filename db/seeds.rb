Manufacturer.delete_all
Car.delete_all

types = "Acura
Audi
BMW
Buick
Cadillac
Chevrolet
Chrysler
Dodge
Eagle
Ferrari
Ford
General Motors
Global Electric Motorcars
GMC
Honda
Hummer
Hyundai
Infiniti
Isuzu
Jaguar
Jeep
Kia
Lamborghini
Land Rover
Lexus
Lincoln
Lotus
Mazda
Mercedes-Benz
Mercury
Mitsubishi Motors
Nissan
Oldsmobile
Peugeot
Pontiac
Porsche
Regal
Saab
Saturn
Subaru
Suzuki
Toyota
Volkswagen
Volvo".split("\n")

types.each do |type|
  FactoryGirl.create(:manufacturer, name: type)
end

Manufacturer.pluck(:id).each do |id|
  20.times do
    FactoryGirl.create(:car, manufacturer_id: id)
  end
end

