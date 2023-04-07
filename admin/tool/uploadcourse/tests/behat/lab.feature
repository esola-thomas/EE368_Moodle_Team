@tool @tool_uploadcourse @_file_upload
Feature: Write a word to the Admin search box and verify the output

  @javascript
  Scenario: search for security
    Given I log in as "admin"
    And I navigate to "" in site administration
    And I set the field "Search" to "security"
    And I press "Search"
    And I should see "Enable web services"
    And I should see "security"

  @javascript
  Scenario: search for selenium
    Given I log in as "admin"
    And I navigate to "" in site administration
    And I set the field "Search" to "selenium"
    And I press "Search"
    Then I should see "No results found."