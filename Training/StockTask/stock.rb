# frozen_string_literal: true

# Find max profit from buying and selling a stock
class Stock
  attr_accessor :max_profits, :prices

  def initialize(args)
    @prices = args.fetch(:prices)
    @max_profits = []
  end


  def find_max_profit(prices)
    prices.max - prices.take(max_price_index).min
  end


  def execute
    while prices.any?
      if max_price_index.zero?
        prices.delete(prices.max)
      else
        max_profits << find_max_profit(prices)
        self.prices = prices.drop(max_price_index + 1)
      end
    end
    max_profits.max
  end

  private

  def max_price_index
    prices.each_with_index.max.last
  end

  def delete_max_when_first(max)
    prices.delete(prices.max)
  end
end
