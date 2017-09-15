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

def combination_sum(nums, target)
  result = []
  backtrack(result, [], nums, target, 0)
  result
end

def backtrack(result, solution, nums, target, start)
  sum = solution.reduce(&:+)

  return                   if sum && sum > target
  result << solution.clone if sum && sum == target

  (start..nums.size - 1).each do |idx|
    solution << nums[idx]
    backtrack(result, solution, nums, target, idx)
    solution.pop
  end
end

combination_sum [2,3,6,7], 7
