require "transfer_service"

describe TransferService do
  subject(:service) { TransferService.new }
  let(:fred_account) { stub(:fred_account).as_null_object }
  let(:bob_account) { stub(:bob_account).as_null_object }

  describe "#transfer" do
    def do_transfer
      service.transfer fred_account, bob_account, 10
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
