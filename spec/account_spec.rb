require "account"

describe Account do
  subject(:account) { Account.new "fred"}

  it "has a name" do
    Account.new("bob").name.should == "bob"
  end

  describe "#deposit" do
    it "increases the balance" do
      expect { account.deposit 42 }.to change { account.balance }.by 42
    end
  end
end
