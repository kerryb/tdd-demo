# encoding: utf-8

Given /^(\w*) has an account containing £(\d+)$/ do |name, balance|
  account = bank.create_account name
  account.deposit balance
end

When /^£(\d+) is tranferred from (\w*) to (\w*)$/ do |amount, from, to|
  bank.transfer from, to, amount
end

Then /^(\w*)'s account balance should be £(\d+)$/ do |name, balance|
  bank.account_for(name).balance.should == balance
end
