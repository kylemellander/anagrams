require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('/', {:type => :feature}) {
  it("loads index page") {
    visit("/")
    expect(page).to have_content("Anagrams!")
  }
}
