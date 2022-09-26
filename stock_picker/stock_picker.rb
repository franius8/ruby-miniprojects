# frozen_string_literal: true

def stock_picker(prices)
  low_price = prices[0]
  low_index = 0
  profit = 0
  result = [0, 0]

  prices.each_with_index do |price, index|
    if price < low_price
      low_price = price
      low_index = index
    end

    if price - low_price > profit
      profit = price - low_price
      result = [low_index, index]
    end
  end
  print result
end

prices = [17, 3, 6, 9, 15, 8, 5, 1, 10]
stock_picker(prices)
