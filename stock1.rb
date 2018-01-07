# find max profit
# [7,1,5,3,6,4]
# [7] [1,5,3,6,4]
# none are greater than 7
# [1] [5,3,6,4]
# all are greater than 1
# find max of subarr which is 6
# 6 - 1 = 5 set it equal to curr max profit
# [5] [3,6,4]
# 6 is greater than 1
# 6-5=1 not greater than curr max profit
# [3] [6,4]
# nothing greater than 3
# [6] [4]
# nothing greater than 6


def max_profit(prices, max=-Float::INFINITY)
  return max if prices.empty?

  buy = prices.first
  sell = []
  prices[1..-1].each { |price| sell << price if price > buy }

  if sell.length > 0
    sell = sell.max
    max = buy - sell if buy - sell > max
  end

  max_profit(prices[1..-1], max)
end

max_profit [7,1,5,3,6,4] # 6-1=5
# puts max_profit [7,6,4,3,1] # 0
# puts max_profit [] # 0
# puts max_profit [1] # 0
# puts max_profit # 0

