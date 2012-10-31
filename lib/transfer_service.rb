class TransferService
  def transfer from, to, amount
    from.withdraw amount
    to.deposit amount
  end
end
