Then /^the search results page is displayed$/ do
  @results_page = SearchResultPage.new
  @results_page.verify_page_loaded
end

Then /^the search results page contains (\d+) individual search results$/ do |count|
  @results_page.have_search_results count
end

Then /^the search results contains "(.*?)" url$/ do |url|
  @results_page.containsUrl url
end