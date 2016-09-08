Feature: I can add restrictions to pages


  Background:
    Given I am logged in to confluence
    And I am on the create new page
    And I create a blank page

  Scenario: As a user I can edit and have the options to add restrictions to the page
    When I open the restriction options
    Then I should be presented with the options to edit restrictions

  Scenario: set restrictions on page
    When I open the restriction options
    And set the restrictions to "Editing restricted"
    Then page should show restrictions were applied

  Scenario: check restrictions are set for restricted editing by restricted user
    And I open the restriction options
    And set the restrictions to "Editing restricted"
    When I login as a non admin user
    And navigate to the restricted page
    Then I should not be able to edit it

  Scenario: check restrictions are set for restricted editing by restricted user
    And I open the restriction options
    And set the restrictions to "Viewing and editing restricted"
    When I login with the username "keith@4kn.co.uk" and password "password1"
    And navigate to the restricted page
    Then I should be redirected to the request access page


