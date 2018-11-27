require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the cost of shipping a parcel', {:type => :feature}) do
  it('takes information about a parcel and calculates shipping cost and volume') do
    visit('/')
    fill_in('length', :with => 3)
    fill_in('width', :with => 4)
    fill_in('height', :with => 5)
    fill_in('weight', :with => 26)
    select 'free', from: 'speed'
    click_button('Check')
    expect(page).to have_content('0.03 ft³')
    expect(page).to have_content(15)
    expect(page).to have_content(15.09)
  end
end
