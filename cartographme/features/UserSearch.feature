Feature:
	'When I go to the user search page, and search for a user,
		I expect to see users with my search term in the result summary.'

Scenario:
	Given that I have gone to the user search page
	When I add "Nhan" to the search box
	And click the Search Button
	Then I should see "Nhan"

Scenario:
	Given that I have gone to the user search page
	When I add "Josh" to the search box
	And click the Search Button
	Then I should see "Josh"
	
Scenario:
	Given that I have gone to the user search page
	When I add "Ashlyn" to the search box
	And click the Search Button
	Then I should see "Ashlyn"
	