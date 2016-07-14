Feature: Api 

Scenario: Transactions returns JSON data
  Given I send and accept JSON
  When I send a GET request to "/transactions"
  Then the response status should be "200"
  And the JSON response should be:
    """
      {"transactions": []}
    """

Scenario: Add a transaction using JSON
  Given I send and accept JSON
  When I send a POST request to "/transactions" with the following:
    """
      {"name": "truck", "cost": "5000"}
    """
  Then the response status should be "201"

Scenario: An invalid transaction should not save and should throw error
  Given I send and accept JSON
  When I send a POST request to "/transactions" with the following:
  """
    { "cost": "5000"}
  """
  Then the response status should be "422"

Scenario: A transaction can be created, returned via JSON and filtered by attribute
  Given I send and accept JSON
  When I send a POST request to "/transactions" with the following:
    """
      {"name": "truck", "cost": "5000", "wheels": "6"}
    """
  Then the response status should be "201"
  When I send a GET request to "/transactions"
  Then the JSON response should have "$..name" with the text "truck"
  And the JSON response should be:
    """
      {"transactions": [{"name": "truck", "cost": 5000}]}
    """






