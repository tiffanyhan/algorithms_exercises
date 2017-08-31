require 'pry'

def two_sum numbers, target
  h = {}
  numbers.each_with_index do |num, idx|
    complement = target - num
    if h[complement]
      return [idx, h[complement]].sort
    else
      h[num] = idx
    end
  end
end

# def two_sum(nums, target)
#   sorted = nums.sort
#   first = nil
#   other = nil
#   lastIdx = nums.length - 1

#   sorted.each_with_index do |num, idx|
#     other = target - num
#     # binary search
#     other = binary_search sorted[idx + 1..lastIdx], other
#     if other
#       first = num
#       break
#     end
#   end

#   first_index = nil
#   other_index = nil

#   nums.each_with_index do |num, idx|
#     if !first_index && first == num
#       first_index = idx
#     elsif !other_index && other == num
#       other_index = idx
#     end
#   end

#   if first_index > other_index
#     first_index, other_index = other_index, first_index
#   end

#   [first_index, other_index]
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

p two_sum [5, 75, 25], 100
puts two_sum([5, 75, 25], 100) == [1, 2]
p two_sum [3, 2, 3], 6
puts two_sum([3, 2, 3], 6) == [0, 2]
p two_sum [3, 3], 6
puts two_sum([3, 3], 6) == [0, 1]
p two_sum [2, 7, 11, 15], 9
puts two_sum([2, 7, 11, 15], 9) == [0, 1]
p two_sum [3, 2, 4], 6
puts two_sum([3, 2, 4], 6) == [1, 2]