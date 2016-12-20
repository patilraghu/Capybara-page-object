class HomePage
  include RSpec::Matchers
  include Capybara::DSL

  @@search_field = '//input[@name="q"]'
  @@google_search_button = "//input[@name='btnK']"
  @@search_button = "//button[@name='btnG']"

  def launch
    visit "http://www.google.com"
  end

  def verify_page_loaded
    expect(page).to have_xpath(@@search_field)
    expect(page).to have_xpath(@@google_search_button)
  end

  def search_for search_text
    fill_in 'q', :with => search_text
    find(:xpath, @@search_button).click
  end

end