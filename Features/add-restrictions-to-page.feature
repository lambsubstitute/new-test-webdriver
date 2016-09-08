Feature: I can add restrictions to pages


  Background:
    Given I am logged in to confluence
    And I am on the create new page
    And I create a blank page

  @wip
  Scenario: As a user I can edit and have the options to add restrictions to the page
    When I open the restriction options
    Then I should be presented with the options to edit restrictions