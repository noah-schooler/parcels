require ('rspec')
require('parcels')
require ('pry')


describe('parcels#volume') do
  it("returns volume of parcel") do
    parcel = Parcels.new(3, 4, 5, 16, "free")
    expect(parcel.volume()).to(eq(60))
  end
end

describe('parcels#cost_to_ship') do
  it("returns 10 for weight 16 and free shipping") do
    parcel = Parcels.new(3, 4, 5, 26, "free")
    expect(parcel.cost_to_ship()).to(eq(15))
  end
  it("returns 26 for height over 25, weight 33, standard shipping") do
    parcel = Parcels.new(12, 12, 25, 33, "standard")
    expect(parcel.cost_to_ship()).to(eq(26))
  end
  it("returns 28 for width over 25, weight 9, one-day shipping") do
    parcel = Parcels.new(12, 25, 12, 9, "one-day")
    expect(parcel.cost_to_ship()).to(eq(28))
  end
  it("returns 38 for dimensions over 25, weight 45, one-day shipping") do
    parcel = Parcels.new(36, 36, 36, 45, "one-day")
    expect(parcel.cost_to_ship()).to(eq(38))
  end
end
