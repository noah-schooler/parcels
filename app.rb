require('sinatra')
require('sinatra/reloader')
require('./lib/parcels.rb')
require('pry')

get ('/') do
  erb(:input)
end

get ('/output') do
  @length = params['length'].to_i
  @width = params['width'].to_i
  @height = params['height'].to_i
  @weight = params['weight'].to_i
  @speed = params['speed']
  parcel = Parcels.new(@length, @width, @height, @weight, @speed)
  @volume_feet = parcel.volume()
  @cost_to_ship = parcel.cost_to_ship()
  erb(:output)
end
