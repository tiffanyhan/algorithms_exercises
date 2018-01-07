require 'pry'

# @param {Integer[]} nums
# @return {Integer}

# brute force
# T: O(N^2), S: O(N)
# for each element in nums, you have to check everything in result
# new array, only add to it if the element isn't already in that array

# def remove_duplicates nums
#   result = []

#   nums.each do |num|
#     result << num unless result.include?(num)
#   end

#   result.length
# end

# array = [1,1,2]
# puts remove_duplicates array # 2

# array = [1,1,1,2,2]
# puts remove_duplicates array # 2

# Hash Map
# T: O(N), S: O(N^2)

# make a new array to hold result
# iterate over nums, check if it is in hash map.
# if not, add to result
# else next

def remove_duplicates nums
  result = []
  seen   = {}

  nums.each do |num|
    next if seen[num]
    result << num
    seen[num] = true
  end

  result.length
end

# array = [1,1,2]
# puts remove_duplicates array # 2

# array = [1,1,1,2,2]
# puts remove_duplicates array # 2

# S: O(1), T: O(N)

# Pointers
# anchor and runner
# anchor starts at 0
# runner starts at 1
# if anchor val is same as runner val, increment runner
# else they're different
#   anchor += 1
#   anchor val = runner val
# etc.

# end when runner is finished looking at each index

def remove_duplicates nums
  return if nums.empty?

  anchor = 0

  (1..nums.length - 1).each do |runner|
    next if nums[anchor] == nums[runner]
    anchor += 1
    nums[anchor] = nums[runner]
  end

  anchor + 1
end

# array = [1,1,2]
# puts remove_duplicates array # 2
# p array

# array = [1,1,1,2,2]
# puts remove_duplicates array # 2
# p array
