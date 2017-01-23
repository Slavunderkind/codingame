# Solution for https://www.codingame.com/ide/puzzle/the-gift
class Gift
  attr_accessor :participants, :gift_price, :budgets_list

  def initialize
    @participants = gets.to_i
    @gift_price = gets.to_i
    @budgets_list = init_budgets_list
  end

  def init_budgets_list
    Array.new(participants) { gets.to_i }.sort
  end

  def not_possible?
    budgets_list.inject(0, :+) < gift_price
  end

  def start
    if not_possible?
      puts 'IMPOSSIBLE'
      return
    end
    money_to_pay = gift_price
    budgets_list.each_with_index.each_with_object([]) do |(budget, index), result|
      contributions_count = budgets_list.size - index
      contribution = (money_to_pay / contributions_count).to_i
      contribution = budget if budget < contribution
      money_to_pay -= contribution
      result << contribution
    end
  end
end

obj = Gift.new
puts obj.start
