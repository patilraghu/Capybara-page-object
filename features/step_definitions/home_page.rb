# now for some tests

When /^I navigate to the google home page$/ do
  @home = HomePage.new
  @home.launch
end

When /^I am on the home page$/ do
  @home.verify_page_loaded
end

When /^I search for Sausages$/ do
  @home.search_for "Sausages"
end

