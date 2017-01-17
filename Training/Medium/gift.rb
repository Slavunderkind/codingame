# Solution for https://www.codingame.com/ide/puzzle/the-gift
class Gift
  attr_accessor :participants, :gift_price, :budgets_list

  def initialize
    @participants = gets.to_i
    @gift_price = gets.to_i
    @budgets_list = init_budgets_list
  end

  def init_budgets_list
    list = []
    participants.times do
      list << gets.to_i
    end
    list.sort
  end

  def not_possible?
    if budgets_list.inject(0, :+) < gift_price
      puts 'IMPOSSIBLE'
      true
    else
      false
    end
  end

  def start
    return if not_possible?
    money_to_pay = gift_price
    budgets_list.each_with_index do |budget, index|
      contributions_count = budgets_list.size - index
      contribution = (money_to_pay / contributions_count).to_i
      contribution = budget if budget < contribution
      money_to_pay -= contribution
      puts contribution
    end
  end
end

obj = Gift.new
obj.start
