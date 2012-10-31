require "bank"

describe Bank do
  subject(:bank) { Bank.new }
  let(:account) { stub }
  before { Account.stub(:new).with("fred").and_return account }

  describe "#create_account" do
    it "returns a new account" do
      bank.create_account("fred").should == account
    end
  end

  describe "#account_for" do
    it "retrieves the named account" do
      bank.create_account("fred")
      bank.account_for("fred").should == account
    end

    it "throws an exception if no account exists" do
      expect { bank.account_for("bob") }.to raise_error(Bank::NoAccountError)
    end
  end
end
