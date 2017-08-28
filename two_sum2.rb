def two_sum numbers, target
  h = {}
  numbers.each_with_index do |num, idx|
    complement = target - num
    if h[complement]
      return [idx + 1, h[complement] + 1].sort
    else
      h[num] = idx
    end
  end
end

# def two_sum numbers, target
#   lastIdx = numbers.length - 1
#   first_index = nil
#   second = nil

#   numbers.each_with_index do |number, idx|
#     complement = target - number
#     second = binary_search numbers[idx + 1..lastIdx], complement
#     if second
#       first_index = idx
#       break
#     end
#   end

#   numbers[first_index] = nil
#   second_index = numbers.index second
#   [first_index + 1, second_index + 1]
# end

# def binary_search array, value
#   lower_bound = 0
#   upper_bound = array.length - 1

#   while lower_bound <= upper_bound do
#     midpoint = (upper_bound + lower_bound / 2)
#     value_at_midpoint = array[midpoint]

#     if value < value_at_midpoint
#       upper_bound = midpoint - 1
#     elsif value > value_at_midpoint
#       lower_bound = midpoint + 1
#     elsif value == value_at_midpoint
#       return value_at_midpoint
#     end
#   end

#   return nil
# end

p two_sum([2, 7, 11, 15], 9)