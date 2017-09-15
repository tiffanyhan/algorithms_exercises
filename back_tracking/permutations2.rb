require 'pry'

# Given a collection of numbers that might contain duplicates, return all possible unique permutations.

# For example,
# [1,1,2] have the following unique permutations:
# [
#   [1,1,2],
#   [1,2,1],
#   [2,1,1]
# ]

       #  1        1       2
       # /|\      /|\     /|\
       #  1 2      1 2     1 1
       #  |  \     |  \    |  \
       #  2   1    2   1   1   1

# @param {Integer[]} nums
# @return {Integer[][]}
# def permute_unique nums
#   permute_helper nums, result={}, []
#   result.keys
# end

# def permute_helper nums, result, permutation, prev_indices={}
#   if permutation.length == nums.length && !result[permutation]
#     return result[permutation.clone] = 1
#   end

#   nums.each_with_index do |num, idx|
#     next if prev_indices[idx]
#     permutation << num
#     prev_indices[idx] = true

#     permute_helper nums, result, permutation, prev_indices

#     permutation.pop
#     prev_indices.delete idx
#   end
# end

def permute_unique nums
  permute_helper nums, result={}, []
  result.keys
end

def permute_helper nums, result, permutation, prev_indices={}
  if permutation.length == nums.length && !result[permutation]
    return result[permutation.clone] = 1
  end

  nums.each_with_index do |num, idx|
    next if prev_indices[idx]

    permutation << num
    prev_indices[idx] = true

    permute_helper nums, result, permutation, prev_indices

    permutation.pop
    prev_indices.delete idx
  end
end

p permute_unique [1,1,2]
