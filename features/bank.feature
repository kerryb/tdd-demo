Feature: Bank accounts

  Scenario: Balance of an account in credit
    Given Fred has an account containing £10
    Then Fred's account balance should be £10


  Scenario: Transfer funds
    Given Fred has an account containing £100
    And Bob has an account containing £50
    When £10 is transferred from Fred To Bob
    Then Fred's account balance should be £90
    Then Bob's account balance should be £60
