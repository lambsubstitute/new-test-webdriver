Feature: as a registered user, I can create new pages

  Background:
    Given I am logged in to confluence
    And I am on the create new page


  Scenario: Create new page form contains the new page options
    Then I should see the standard create new page inputs

  Scenario: Create new blank page
    When I create a blank page
    Then I should be redirected to the new page

  Scenario: Preview blank page
    Given I am on the create new page
    And I give the page a title
    When I preview the new page
    Then The new page preview should be displayed


   Scenario: adding a page with no name
     When I create the blank page with the name " "
     Then I should receive the validation error
     """
    This page needs a name
    Add a page title before hitting publish.
     """

  Scenario: adding a page with the same name as one already existing in the same space
    When I create a new page with the same name as one that exists
    Then I should receive the validation error
     """
     A page with the title 'page_title_placeholder' already exists in this space. Enter a different title for your page.
     """

