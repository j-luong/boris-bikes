require './lib/docking_station'

puts "station = DockingStation.new"
station = DockingStation.new

puts "bmx = Bike.new"
bmx = Bike.new

puts "bmx.working?"
bmx.working?

puts "station.dock(bmx)"
station.dock(bmx)

puts "bmx2 = station.release_bike"
bmx2 = station.release_bike

puts "station.get_bikes"
station.get_bikes

puts "station.dock(bmx)"
station.dock(bmx)

puts "bmx2 = station.release_bike"
bmx2 = station.release_bike

puts "Test: dock 20 bikes into station"
20.times do
  station.dock(Bike.new)
end

puts "Testing the capacity of a station"
stn_0 = DockingStation.new
stn_0.capacity

puts "Changing the default capacity of a new station"
stn_1 = DockingStation.new(100)
stn_1.capacity

puts "Checking that we can call report broken"
station = DockingStation.new
bike = Bike.new
station.dock(bike)
station.report_broken

puts "Checking if a broken bike is working"
station = DockingStation.new
bike = Bike.new
station.dock(bike)
station.report_broken
bike.working?

puts "Checking that station won't release a broken bike"
station = DockingStation.new
bike = Bike.new
station.dock(bike)
station.report_broken
station.release_bike
