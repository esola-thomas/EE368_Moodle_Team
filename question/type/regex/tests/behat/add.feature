@qtype @qtype_regex
Feature: Test creating a Regex question
  As a teacher
  In order to test my students
  I need to be able to create a Regex question

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

  Scenario: Create a Regex question
    When I am on the "Course 1" "core_question > course question bank" page logged in as teacher
    And I add a "Regex" question filling the form with:
      | Question name            | regex-001                      |
      | Question text            | Match following pattern mm/dd/yyyy year start at 2000 or 1900 or month 02 |
      | General feedback         | This is general feedback       |
      | Use case-insensitive     | Checked                        |
      | Allow partial credit     | Checked                        |
      | id_answer_0          | **/**/20**                                |
      | id_fraction_0        | 100%                                      |
      | id_feedback_0        | valid 1                                   |
      | id_answer_1          | **/**/19**                                |
      | id_fraction_1        | 100%                                      |
      | id_feedback_1        | valid 2                                   |
      | id_answer_2          | 02/**/****                                |
      | id_fraction_2        | 100%                                      |
      | id_feedback_2        | valid 3                                   |
    Then I should see "regex-001"
