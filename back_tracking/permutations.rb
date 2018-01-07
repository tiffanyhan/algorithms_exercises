# Given a collection of distinct numbers, return all possible permutations.

# For example,
# [1,2,3] have the following permutations:
# [
#   [1,2,3],
#   [1,3,2],
#   [2,1,3],
#   [2,3,1],
#   [3,1,2],
#   [3,2,1]
# ]

# distinct: not equal to each other
# permutation: a way that the set of numbers can be ordered

# input: an array of distinct numbers
# output: an array of arrays, with each inner array being a possible permutation
# constraint: no numbers can be repeated in each permutation
# edge case: if input is [], just return []?
  # the input array also counts as a possible permutation

# [1,2,3,4]
# [
#   [1,2,3,4],
#   [1,2,4,3],
#   [1,3,2,4],
#   [1,3,4,2],
#   [1,4,2,3],
#   [1,4,3,2],
#   [2,1,3,4],
#   [2,1,4,3],
#   [2,3,1,4],
#   [2,3,4,1],
#   [2,4,1,3],
#   [2,4,3,1],
#   etc...
# ]

# steps
# helper(given knowledge of nums, permutation, and permutations)
#   if length of permutation is equal to length of nums, then add permutation to permutations
#     and terminate recursion

#   iterate thru all nums in given array
#     if permutation already includes num, skip
#     else add num to permutation
#     recurse into still promising solution space?
#     recursion cleanup

def permute(nums)
  permute_helper(nums, [], permutations=[])
  permutations
end

def permute_helper(nums, permutation, permutations)
  return permutations << permutation.clone if permutation.length == nums.length

  nums.each do |num|
    next if permutation.include?(num)
    permutation << num
    permute_helper(nums, permutation, permutations)
    permutation.pop
  end
end
