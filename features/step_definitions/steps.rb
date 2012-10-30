# encoding: utf-8

Given /^(\w*) has an account containing £(\d+)$/ do |name, balance|
  bank.create_account "Fred"
end

Then /^(\w*)'s account balance should be £(\d+)$/ do |name, balance|
  bank.account_for(name).balance.should == balance
end
