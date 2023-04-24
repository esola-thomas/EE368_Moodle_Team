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
#    And the following "questions" exist:
#      | questioncategory | qtype   | name           | template            |
#      | Test questions   | RegEx   | regex-001      | Match following pattern\. |
      
  @javascript @_switch_window
  Scenario: Preview a Regular Expression question with correct answer
    When I am on the "Course 1" "core_question > course question bank" page logged in as teacher
    And I add a "RegEx" question filling the form with:
      | Question name            | regex-001                      |
      | Question text            | Enter 1234 |
      | General feedback         | This is general feedback       |
      #| Use case-insensitive     | Checked                        |
      #| Allow partial credit     | Checked                        |
      | id_answer_0          | 1234                                      |
      | id_fraction_0        | 100%                                      |
      | id_feedback_0        | valid 1                                   |
      | id_answer_1          | 12345                                     |
      | id_fraction_1        | 100%                                       |
      | id_feedback_1        | valid 2                                   |
      | id_answer_2          | 012345678                                  |
      | id_fraction_2        | 100%                                      |
      | id_feedback_2        | valid 3                                   |
    When I am on the "regex-001" "core_question > preview" page logged in as teacher
    And I should see "Enter 1234"
    And I set the field with xpath "//input[contains(@id, '1_answer')]" to "12345"
    And I press "finish"
    Then I should see "valid 1"