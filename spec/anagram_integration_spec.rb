require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('/', {:type => :feature}) {
  it("loads index page") {
    visit("/")
    expect(page).to have_content("Anagrams!")
  }
  it("returns anagrams on the results page when only one possibility given") {
    visit("/")
    fill_in("origin_word", :with => "Andrew")
    fill_in("possible_anagrams", :with => "warden")
    click_button('Go!')
    expect(page).to have_content("warden")
  }
}
