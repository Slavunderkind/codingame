# frozen_string_literal: true

# Find max profit from buying and selling a stock
class Stock
  attr_accessor :profits, :prices

  def initialize(args)
    @prices = args.fetch(:prices)
    @profits = []
  end

  def find_max_profit
    return unless prices.take(sell_price_index).min

    prices.max - prices.take(sell_price_index).min
  end

  def execute
    while prices.any?
      profits << find_max_profit
      self.prices = prices.drop(sell_price_index + 1)
    end
    profits.compact.max
  end

  private

  def prices_before_selling(selling_price_index)
    prices.take(selling_price_index)
  end

  def sell_price_index
    prices.each_with_index.max.last
  end
end
