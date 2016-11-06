Feature:
	'When I go to the user search page, and search for a user,
		I expect to see users with my search term in the result summary.'

Scenario: Successful Search for rama
	Given that I have gone to the user search page
	When I add "rama" to the search box
	And click the Search Button
	Then I should see "rama" in the results

Scenario: Unsuccessful Search for Josh (not created)
	Given that I have gone to the user search page
	When I add "Josh" to the search box
	And click the Search Button
	Then I should not see "Josh" in the results
	