class Patron
  attr_reader :name, :spending_money, :interests
  def initialize(name, spending_money)
    @name = name
    @spending_money = 20
    @interests = []
  end

  def add_interest(subject)
    @interests << subject
  end
end
