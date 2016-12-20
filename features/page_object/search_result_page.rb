class SearchResultPage
  include RSpec::Matchers
  include Capybara::DSL
  include Test::Unit::Assertions

  @@search_results =  "//div[@id='search']//div[@class='g']"
  @@url_matcher =  "//div[@id='search']//div[@class='g']//h3//a"
  @@result_stats = "//div[@id='resultStats']"

  def verify_page_loaded
    expect(page).to have_xpath(@@search_results)
    expect(page).to have_xpath(@@result_stats)
  end

  def have_search_results result_count
    expect(page.all(:xpath, @@search_results).count).to be == result_count.to_i
  end

  def containsUrl expected_url
    page.all(:xpath, @@url_matcher).each do |row|
      if row['href'] == expected_url
        return true
      end
    end
    assert_equal(expected_url, nil, "Expected URL not found")
  end

end