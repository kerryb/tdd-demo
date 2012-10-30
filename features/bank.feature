Feature: Bank accounts

  Scenario: Balance of an account in credit
    Given Fred has an account containing £10
    Then Fred's account balance should be £10
