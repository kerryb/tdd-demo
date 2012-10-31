require "transfer_service"

describe TransferService do
  describe "#transfer" do
    let(:fred_account) { stub.as_null_object }
    let(:bob_account) { stub.as_null_object }

    subject(:transfer_service) { TransferService.new }

    it "withdraws the amount from the source account" do
      fred_account.should_receive(:withdraw).with(50)
      transfer_service.transfer fred_account, bob_account, 50
    end

    it "deposits the amount in the source account" do
      bob_account.should_receive(:deposit).with(50)
      transfer_service.transfer fred_account, bob_account, 50
    end
  end
end
