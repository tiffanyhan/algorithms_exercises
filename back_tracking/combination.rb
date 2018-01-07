# Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.

# For example,
# If n = 4 and k = 2, a solution is:

# [
#   [2,4],
#   [3,4],
#   [2,3],
#   [1,2],
#   [1,3],
#   [1,4],
# ]

# [1,2,3,4], length 2

# combination: it includes numbers that are also included in input
# constraint: no permutations allowed, each combination must be unique
# edge case: can length be 0? then return []. can length be input length? then return input

# n = 4, k = 3
# [1,2,3,4], length 3

# [1,2,3]
# [2,3,4]
# [1,2,4]
# [1,3,4]

# if no permutations allowed, seems similar to subset problem
# same algorithm, but only add subset to subsets if length is right?!

# helper(nums, combination, combinations, start, length)
#   if length of combination is equal to k, add combination to combinations

#   iterate thru 0..nums.length - 1
#     add num to combination
#     recurse, but now start at index + 1
#     recursion cleanup

def combine(n, k)
  combinations = []
  combine_helper(n, k, [], combinations, 1)
  combinations
end

def combine_helper(limit, length, combination, combinations, start)
  combinations << combination.clone if combination.length == length

  (start..limit).each do |num|
    combination << num
    combine_helper(limit, length, combination, combinations, num + 1)
    combination.pop
  end
end

p combine 4, 2
