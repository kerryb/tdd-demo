describe TransferService do
  let(:fred_account) { mock("Fred's account").as_null_object }
  let(:bob_account) { mock("Bob's account").as_null_object }

  describe "#transfer" do
    def do_transfer
      TransferService.new.transfer fred_account, bob_account, 50
    end

    it "withdraws the amount from the source account" do
      fred_account.should_receive(:withdraw).with(50)
      do_transfer
    end

    it "deposits the amount in the destination account" do
      bob_account.should_receive(:deposit).with(50)
      do_transfer
    end
  end
end
