# frozen_string_literal: true
require 'byebug'
# Find max profit from buying and selling a stock
class Stock
  attr_accessor :profits, :prices

  def initialize(args)
    @prices = args.fetch(:prices)
    @profits = []
  end

  def find_max_profit
    return unless prices.take(max_price_index).min

    prices.max - prices.take(max_price_index).min
  end

  def execute
    while prices.any?
      profits << find_max_profit
      self.prices = prices.drop(max_price_index + 1)
    end
    profits.compact.max
  end

  private

  def max_price_index
    prices.each_with_index.max.last
  end
end
