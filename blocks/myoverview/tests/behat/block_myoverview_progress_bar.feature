@core @core_admin @javascript
Feature: Ensure course completion progress bar appears properly on course cards
  Background:
    Given I am logged in as "admin"
    When I select "My courses" from primary navigation
    And I click on "Create new course" "link"
    And I set the field "Course full name" to "EE368 Moodle"
    And I set the field "Course short name" to "EE368"
    And I click on "Save and display" "button"
    And I click on "Edit mode" "field"
    And I wait until the page is ready
    And I add a "Assignment" to section "1" and I fill the form with:
      | name                |                        Quiz1                         |
      | Completion tracking | Students can manually mark the activity as completed |
    And I wait until the page is ready
    And I add a "Assignment" to section "1" and I fill the form with:
      | name                |                        hw1                           |
      | Completion tracking | Students can manually mark the activity as completed |
    And I wait until the page is ready
    And I add a "Assignment" to section "1" and I fill the form with:
      | name                |                        hw2                           |
      | Completion tracking | Students can manually mark the activity as completed |
    And I wait until the page is ready
    And I add a "Assignment" to section "1" and I fill the form with:
      | name                |                        project1                      |
      | Completion tracking | Students can manually mark the activity as completed |
    And I wait until the page is ready
    And I add a "Assignment" to section "1" and I fill the form with:
      | name                |                        project2                      |
      | Completion tracking | Students can manually mark the activity as completed |
    And I wait until the page is ready
    And I add a "Assignment" to section "1" and I fill the form with:
      | name                |                        exam1                         |
      | Completion tracking | Students can manually mark the activity as completed |

  Scenario: 1/6
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation

    #16% Complete, 1/6
    #Then "//div[@class='progress-text'][contains(@style,'value: 16')]" "xpath" should exist
    Then I should see "16%"

  Scenario: 2/6
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation
    And I wait until the page is ready
    #Then "//div[@class='progress-text'][contains(@style,'value: 16')]" "xpath" should exist
    Then I should see "33%"

  Scenario: 3/6
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation
    And I wait until the page is ready
    #Then "//div[@class='progress-text'][contains(@style,'value: 16')]" "xpath" should exist
    Then I should see "50%"

  Scenario: 4/6
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation
    And I wait until the page is ready
    #Then "//div[@class='progress-text'][contains(@style,'value: 16')]" "xpath" should exist
    Then I should see "66%"

  Scenario: 5/6
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation
    And I wait until the page is ready
    #Then "//div[@class='progress-text'][contains(@style,'value: 16')]" "xpath" should exist
    Then I should see "83%"

  Scenario: 6/6
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I click on "Mark as done" "button"
    And I select "My courses" from primary navigation
    And I wait until the page is ready
    #Then "//div[@class='progress-text'][contains(@style,'value: 16')]" "xpath" should exist
    Then I should see "100%"