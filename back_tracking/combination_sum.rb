require 'pry'

# For example, given candidate set [2, 3, 6, 7] and target 7,
# A solution set is:
# [
#   [7],
#   [2, 2, 3]
# ]

# tries
# [2]
# [2,2]
# [2,2,2]
# [2,2,2,2] sum = 8 > target = 7, so return
# [2,2,2] pop off last 2
# loop ends, go to next idx
# [2,2,2,3] sum = 9  > target = 7, so return
# [2,2,2,6] sum = 12 > target = 7, so return
# [2,2,2,7] sum = 13 > target = 7, so return

# Given a set of candidate numbers (C) (without duplicates)
# and a target number (T), find all unique combinations in C
# where the candidate numbers sums to T.

# The same repeated number may be chosen from C unlimited number of times.

# Note:
# All numbers (including target) will be positive integers.
# The solution set must not contain duplicate combinations.
# For example, given candidate set [2, 3, 6, 7] and target 7,
# A solution set is:
# [
#   [7],
#   [2, 2, 3]
# ]

# combination: each one must be unique, no permutations of another
#   must sum to target number
# rule: any num in nums can be used more than once in a combination
# important: all nums will be positive. target is also positive!

# input: an array of nums
# output: an array of arrays, where each inner array is a combination that
#   meets the requirements
# edge case: if given [], return []? will i ever get negative numbers?

# backtrack: when sum is > target. when num is already > target.

# how do i guard against duplicates?

# helper(nums, target, combination, combinations)
#   add combination to combinations if sum is target
#   base case return if sum > target

#   iterate thru nums
#     add num to combination
#     **recurse, but only iterate from current start index
#     recursion cleanup

def combination_sum(nums, target)
  combinations = []
  combination_sum_helper(nums, target, [], combinations, 0)
  combinations
end

def combination_sum_helper(nums, target, combination, combinations, start)
  sum = combination.reduce(:+) || 0
  return if sum > target
  return combinations << combination.clone if sum == target

  (start..nums.length - 1).each do |index|
    combination << nums[index]
    combination_sum_helper(nums, target, combination, combinations, index)
    combination.pop
  end
end
