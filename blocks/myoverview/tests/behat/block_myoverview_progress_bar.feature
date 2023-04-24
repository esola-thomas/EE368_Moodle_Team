@block @block_myoverview @javascript
Feature: Visual Completion Bar
  In order to show the progress of the course visually
  As a student
  I want to see the completion bar changes color as more is completed
  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email | idnumber |
      | teacher1 | Teacher | 1 | teacher1@example.com | T1 |
      | student1 | Student | 1 | student1@example.com | S1 |
    And the following "courses" exist:
      | fullname | shortname | category | enablecompletion | startdate     | enddate       |
      | Course 1 | C1        | 0        | 1                | ##yesterday## | ##tomorrow##  |
    And the following "activities" exist:
      | activity | course | idnumber | name          | intro                   | timeopen      | timeclose     |
      | choice   | C1     | choice1  | Test choice 1 | Test choice description | ##yesterday## | ##tomorrow##  |
      | forum    | C1     | forum1   | Test forum 1  | Test forum description  | ##yesterday## | ##tomorrow##  |
      | quiz     | C1     | Quiz_1   | Test quiz 1  | Test forum description  | ##yesterday## | ##tomorrow##  |
      | quiz     | C1     | Quiz_2   | Test quiz 2  | Test forum description  | ##yesterday## | ##tomorrow##  |
      | quiz     | C1     | Quiz_3   | Test quiz 3  | Test forum description  | ##yesterday## | ##tomorrow##  |
      | quiz     | C1     | Quiz_4   | Test quiz 4  | Test forum description  | ##yesterday## | ##tomorrow##  |
      #| assigment| C1     | assig_1  | Test forum 1  | Test forum description  | ##yesterday## | ##tomorrow##  |
      #| assigment| C1     | assig_2  | Test forum 1  | Test forum description  | ##yesterday## | ##tomorrow##  |
    #And I add a "hw1" to section "1" of "C1"
    #And I add a "hw2" to section "2" of "C1"
    And the following "course enrolments" exist:
      | user | course | role            |
      | teacher1 | C1 | editingteacher  |
      | student1 | C1 | student         |
  Scenario: Visual Completion Bar changes color as course is completed
    Given I am on the "My courses" page logged in as "student1"
    #And I am enrolled in Course 1
    And I should see "Course 1"
    And I should see "0% complete"
    #And the course completion status is set to 0%
    When I complete the "Test choice 1" activity
#    Then I should see the completion bar in the "Course overview" block is red
#    And the course completion status is set to 33%
#    When I complete the "Test forum 1" activity
#    Then I should see the completion bar in the "Course overview" block is yellow
#    And the course completion status is set to 66%
#    When I complete the remaining activities in the course
#    Then I should see the completion bar in the "Course overview" block is green
#    And the course completion status is set to 100%