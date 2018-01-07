require 'pry'

# Given a collection of numbers that might contain duplicates,
# return all possible unique permutations.

# For example,
# [1,1,2] have the following unique permutations:
# [
#   [1,1,2],
#   [1,2,1],
#   [2,1,1]
# ]

# permutation: a way that numbers can be ordered
#   unique means can't be [2,1,1] and [2,1,1]
# input: nums array
# output: array of arrays, where each inner array is a unique permutation

# edge case: if given [], return []. original nums array counts as possible permutation.

# [1,2,2]
# [
#   [1,2,2],
#   [2,2,1],
#   [2,1,2]
# ]

# helper
#   check if permutation is a duplicate, if not add

#   iterate thru each index in nums
#     if index in prev_indices, skip
#     add num to permutation
#     add index to prev_indices
#     recurse
#     recursion cleanup

def permute_unique(nums)
  permutations = {}
  permute_unique_helper(nums, [], permutations, prev_indices=[])
  permutations.keys
end

def permute_unique_helper(nums, permutation, permutations, prev_indices)
  if permutation.length == nums.length
    return permutations[permutation.clone] = 1 unless permutations[permutation]
  end

  (0..nums.length - 1).each do |index|
    next if prev_indices[index]
    permutation << nums[index]
    prev_indices[index] = true
    permute_unique_helper(nums, permutation, permutations, prev_indices)
    permutation.pop
    prev_indices[index] = nil
  end
end
