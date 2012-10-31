require "account"

class Bank
  class NoAccountError < RuntimeError; end

  def create_account name
    accounts[name] = Account.new(name)
  end

  def account_for name
    accounts.fetch(name) { raise NoAccountError }
  end

  private

  def accounts
    @accounts ||= {}
  end
end
