module KnowsAboutBank
  def bank
    @bank ||= Bank.new
  end
end
World KnowsAboutBank
