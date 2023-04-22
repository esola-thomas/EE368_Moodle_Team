@qtype @qtype_regex
Feature: Preview a Regular Expression question
  As a teacher
  In order to check my Regular Expression questions will work for students
  I need to preview them

  Background:
    Given the following "users" exist:
      | username |
      | teacher  |
    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1        | 0        |
    And the following "course enrolments" exist:
      | user    | course | role           |
      | teacher | C1     | editingteacher |
    And the following "question categories" exist:
      | contextlevel | reference | name           |
      | Course       | C1        | Test questions |
    And the following "questions" exist:
      | questioncategory | qtype   | name           | template            |
      | Test questions   | regex   | regex-001      | Match following pattern\. |
      
  @javascript @_switch_window
  Scenario: Preview a Regular Expression question with correct answer
    When I am on the "regex-001" "core_question > preview" page logged in as teacher
    And I should see "Match following pattern mm/dd/yyyy year start at 2000 or 1900 or month 02"
    # Set behaviour options
    And I set the following fields to these values:
      | behaviour        | immediatefeedback |
    And I press "Start again with these options"
    And I set the field with xpath "//div[@class='qtext']//input[@name='answer[1]']" to "03/12/2015"
    And I press "Check"
    Then I should see "valid 1"

  @javascript @_switch_window
  Scenario: Preview a Regular Expression question with incorrect answer
    When I am on the "regex-001" "core_question > preview" page logged in as teacher
    And I should see "Match following pattern mm/dd/yyyy year start at 2000 or 1900 or month 02"
    # Set behaviour options
    And I set the following fields to these values:
      | behaviour        | immediatefeedback |
    And I press "Start again with these options"
    And I set the field with xpath "//div[@class='qtext']//input[@name='answer[1]']" to "05/13/1756"
    And I press "Check"
    Then I should see "Sorry, try again."
