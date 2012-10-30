require "account"

class Bank
  def create_account name
  end

  def account_for name
    Account.new
  end
end
