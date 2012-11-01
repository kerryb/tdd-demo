require "bank"

describe Bank do
  subject(:bank) { Bank.new }
  let(:fred_account) { stub(:fred_account).as_null_object }
  let(:bob_account) { stub(:bob_account).as_null_object }

  before do
    Account.stub(:new).with("fred").and_return fred_account
    Account.stub(:new).with("bob").and_return bob_account
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

  describe "#transfer" do
    before do
      bank.create_account "fred"
      bank.create_account "bob"
    end

    def do_transfer
      bank.transfer "fred", "bob", 10
    end

    it "withdraws the amount from the source account" do
      fred_account.should_receive(:withdraw).with(10)
      do_transfer
    end

    it "deposits the amount in the destination account" do
      bob_account.should_receive(:deposit).with(10)
      do_transfer
    end
  end
end
