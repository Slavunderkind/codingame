# frozen_string_literal: true

# Find max profit from buying and selling a stock
class Stock
  attr_reader :prices

  def initialize(args)
    @prices = args.fetch(:prices)
  end

  def execute
    profit = nil

    while profit.nil?
      max_price_index = prices.each_with_index.max.last

      if max_price_index.zero?
        prices.delete(prices.max)
      else
        profit = prices.max - prices.take(max_price_index).min
      end
    end
    profit
  end

  private

  def delete_max_when_first(max)
    prices.delete(prices.max)
  end
end
