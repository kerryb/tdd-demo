require "bank"

describe Bank do
  subject(:bank) { Bank.new }
  let(:fred_account) { stub("Fred's account") }

  before do
    Account.stub(:new).with("fred").and_return fred_account
  end

  describe "#create_account" do
    it "returns a new account" do
      bank.create_account("fred").should == fred_account
    end
  end

  describe "#account_for" do
    it "retrieves the named account" do
      bank.create_account("fred")
      bank.account_for("fred").should == fred_account
    end

    it "throws an exception if no account exists" do
      expect { bank.account_for("bob") }.to raise_error(Bank::NoAccountError)
    end
  end
end
