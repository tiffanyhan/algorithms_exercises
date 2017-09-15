require 'pry'

# Given a set of distinct integers, nums, return all possible subsets.

# Note: The solution set must not contain duplicate subsets.

# For example,
# If nums = [1,2,3], a solution is:

# [
#   [3],
#   [1],
#   [2],
#   [1,2,3],
#   [1,3],
#   [2,3],
#   [1,2],
#   []
# ]

# a subset is defined as a set of numbers that is
# contained within another set of numbers

# an empty collection, and the collection itself
# will be subsets of the collection

# for subsets of length 1, each item in the collection
# will be a subset of the collection (bc integers are distinct)

# for subsets of length = 2..collectionLength - 1,
# get all combinations such that each integer is distinct
# but what abt duplicate subsets? permutations don't count.

# after we get all possible subsets starting with 1,
# we should exclude 1 from our subsequent processing

# []
# [1]
# [1,2]
# [1,2,3]
# [2,3]

# result evaluated in this order: [[], [1], [1, 2], [1, 2, 3], [1, 3], [2], [2, 3], [3]]

# @param {Integer[]} nums
# @return {Integer[][]}
# def subsets(nums)
#   subsets_helper(nums, [], result=[], 0)
#   result
# end

# def subsets_helper(nums, subset, result, start)
#   result << subset.clone # we add subset to result no matter what the length is, first time adds []

#   (start..nums.size - 1).each do |idx| # looping this way lets us exclude indices, if start > than last idx we don't even enter loop
#     binding.pry
#     subset << nums[idx] # we add to the subset and recurse no matter what, no next bc we're already excluding indices
#     subsets_helper(nums, subset, result, idx + 1)
#     subset.pop
#   end
# end

# subsets [1,2,3]

# [[], [1], [1, 2], [1, 2, 3], [1, 3], [1, 3, 2], [2],
# [2, 1], [2, 1, 3], [2, 3], [2, 3, 1], [3], [3, 1],
# [3, 1, 2], [3, 2], [3, 2, 1]]

# ^^ what we return when we always add a subset to result,
# but we DON'T exclude indices

# subsets_helper nums=[1,2,3], result=[], subset=[], start=0
# result = [[], ]
# [0,1,2] for each (our global outer loop)
# idx 0 start at first idx
# subset = [1] add item at first idx to subset

# for idx 0, call self and exclude idx 0
# subsets_helper nums=[1,2,3], result=[], subset=[1], start=1
# result = [[], [1]]
# [1,2] our inner loop for [0] idx
# subset=[1,2] add item at second idx to subset

# call self again and exclude idx 1 (idx 0 already excluded)
# subsets_helper nums=[1,2,3], result=[], subset=[1,2], start=2
# result = [[], [1], [1,2]]
# [2] our loop
# subset=[1,2,3] add item at third idx to subset

# call self and exclude idx 2
# subsets_helper nums=[1,2,3], result=[], subset=[1,2,3], start=3
# [] start is out of range return

# subset = [1,2] pop the 3 off

#    1        2          3
#   /|\      /|\
#    2 3        3
#   /|\
#      3

# pruning the tree as you go along (dynamic)
# when you branch, you only branch the numbers behind it
# EACH NODE represents a solution
# branching logic is complicated, so dead-end logic is nil

def subsets nums
  subsets_helper nums, result=[], [], 0
  result
end

def subsets_helper nums, result, subset, start
  result << subset.clone

  (start..nums.size - 1).each do |idx|
    subset << nums[idx]
    subsets_helper(nums, result, subset, idx + 1)
    subset.pop
  end
end

p subsets([1,2,3])

def subsets(nums)
  result = []
  subsets_helper(nums, [], result)
  result
end

# explicit solution

# solution: a valid subset
# branching logic: T/F to whether take the number at position i
# prune: none
# backtrack: pop

def subsets_helper(nums, solution, result)
  if solution.size == nums.size
    result << apply_mask(nums, solution)
  else
    [true, false].each do |boolean|
      solution << boolean
      subsets_helper(nums, solution, result)
      solution.pop
    end
  end
end

def apply_mask(array, booleans)
  result = []
  array.each_with_index do |num, index|
    result << num if booleans[index]
  end
  result
end
