require "account"
require "transfer_service"

class Bank
  class NoAccountError < RuntimeError; end

  attr_writer :transfer_service

  def create_account name
    accounts[name] = Account.new(name)
  end

  def account_for name
    accounts.fetch(name) { raise NoAccountError }
  end

  def transfer from, to, amount
    transfer_service.transfer accounts[from], accounts[to], amount
  end

  private

  def transfer_service
    @transfer_service ||= TransferService.new
  end

  def accounts
    @accounts ||= {}
  end
end
