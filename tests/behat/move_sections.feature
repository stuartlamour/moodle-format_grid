@format @format_grid
Feature: Sections can be moved - adapted from core test of the same name.
  In order to rearrange my course contents
  As a teacher
  I need to move sections up and down

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email                |
      | daisy    | Daisy     | Grid     | daisy@grid.com |
    And the following "courses" exist:
      | fullname | shortname | format | coursedisplay | numsections |
      | Grid     | GD        | grid   | 0             | 5           |
    And the following "course enrolments" exist:
      | user  | course | role           |
      | daisy | GD     | editingteacher |
    And the following "activities" exist:
      | activity | name               | intro                       | course | idnumber | section |
      | forum    | Test forum name    | Test forum name description | GD     | forum1   | 1       |
    And I log in as "daisy"
    And I am on "Grid" course homepage with editing mode on

  Scenario: Move up and down a section with Javascript disabled in a single page course
    When I move down section "1"
    Then I should see "Test forum name" in the "Section 2" "section"
    And I move up section "2"
    And I should see "Test forum name" in the "Section 1" "section"

  @javascript
  Scenario: Move section with javascript
    When I open section "1" edit menu
    And I click on "Move" "link" in the "Section 1" "section"
    And I click on "Section 3" "link" in the ".modal-body" "css_element"
    Then I should see "Test forum name" in the "Section 3" "section"
