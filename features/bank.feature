Feature: Bank accounts

  Scenario: Balance of an account in credit
    Given Fred has an account containing £10
    Then Fred's account balance should be £10


  Scenario: Transfer funds between two accounts
    Given Fred has an account containing £100
    And Bob has an account containing £50
    When £10 is tranferred from Fred to Bob
    Then Fred's account balance should be £90
    And Bob's account balance should be £60
