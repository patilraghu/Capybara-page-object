Feature: Google search test

@LOGON1
Scenario: Successful login (Admin User)
	Given I navigate to the google home page
  	Then I am on the home page
  	When I search for Sausages
  	Then the search results page is displayed
  	And the search results page contains 10 individual search results
  	And the search results contains "https://en.wikipedia.org/wiki/Sausage" url
