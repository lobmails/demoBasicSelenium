@Regression
Feature: Address update
  In order to update client's address
  As an adviser or staff member
  We want to be able to update their address through evolve self service

  Scenario Outline: Update address when residential address and postal address are the same
    Given I'm logged in as a staff member
    When I search for policy number 79597245
    And I navigate to update the current address
    And I change the residential address to
      | country   | <country>   |
      | postcode  | <postcode>  |
      | state     | <state>     |
      | suburb    | <suburb>    |
      | address 1 | <address 1> |
      | address 2 | <address 2> |
    And select postal address is same as residential address
#    And I save the recent address changes
    And I save the recent address changes and closing the update successful
    Then the address is updated in the policy details page
    And the address is updated in the address history page
    Examples:
      | country     | postcode | state | suburb    | address 1         | address 2         |
      | AUSTRALIA   | 3182     | VIC   | Melbourne | 509 St Kilda Road | Suite 109 Floor 5 |
      | NEW ZEALAND |          |       | Pipitea   | 7 Waterloo Quay   | Apartment 209     |

  Scenario Outline: Update address when residential address and postal address are different
    Given I'm logged in as a staff member
    When I search for policy number 79597245
    And I navigate to update the current address
    And I change the residential address to
      | country   | <res country>   |
      | postcode  | <res postcode>  |
      | state     | <res state>     |
      | suburb    | <res suburb>    |
      | address 1 | <res address 1> |
      | address 2 | <res address 2> |
    And select postal address is different to residential address
    And I change the postal address to
      | country   | <res country>   |
      | postcode  | <res postcode>  |
      | state     | <res state>     |
      | suburb    | <res suburb>    |
      | address 1 | <pos address 1> |
      | address 2 | <pos address 2> |
#    And I save the recent address changes
    And I save the recent address changes and closing the update successful
    Then the addresses are updated in the policy details page
    And the addresses are updated in the address history page
    Examples:
      | res country | res postcode | res state | res suburb | res address 1     | res address 2     | pos address 1 | pos address 2 |
      | AUSTRALIA   | 3182         | VIC       | Melbourne  | 509 St Kilda Road | Suite 109 Floor 5 | 385 Bourke St | Apartment 1   |
      | NEW ZEALAND |              |           | Pipitea    | 7 Waterloo Quay   | Apartment 209     | 160 Queen St  | Level 5       |