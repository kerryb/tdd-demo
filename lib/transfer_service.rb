class TransferService
  def transfer source_account, destination_account, amount
    source_account.withdraw amount
    destination_account.deposit amount
  end
end
