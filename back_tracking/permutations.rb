require 'pry'

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

# [1,2,3]
# solution = [1]
# num = 1
# permute_helper(nums=[1,2,3], solution=[1], result=[])

# num = 1 # another loop
# next # bc solution already contains 1
# num = 2
# solution = [1,2]
# permute_helper(nums=[1,2,3], solution=[1,2], result=[])

# num = 1 # yet another nested loop
# next # bc solution already contains 1
# num = 2
# next # bc solution already contains 2
# num = 3
# solution = [1,2,3]
# permute_helper(nums=[1,2,3], solution=[1,2,3], result=[])

# result = [[1,2,3], ] # bc solution size is as big as we want

# permute_helper(nums=[1,2,3], solution=[1,2,3], result=[]) # we were here before
# solution=[1,2] # backtracking to "tree 2nd level"

#    1        2          3
#   /|\      /|\        /|\
#  1 2 3    1 2 3      1 2 3
#   /|\        /|\
#  1 2 3      1 2 3

#    1        1          2
#   /|\      /|\        /|\
#  1 2 3    1 2 3      1 2 3
#   /|\        /|\
#  1 2 3      1 2 3

# when a path is not promising, (num is already in solution) don't even recurse
# each time you DO recurse, you need to finish a loop in order to complete
#   the recursive call
# so you can only pop from solution array after you complete a loop

# [1,2,3] # global outermost loop is now on its last element
# solution = [] does not contain 3, so recurse into it
# solution = [3] recurse and loop thru [1,2,3] to add second element
# program will finish when global outermost loop finishes

# [1,2,3] # global outermost loop is on its first element
# solution = [] does not contain 1, so recurse into it

# solution = [1], now try [1,2,3]
# 1 is already in there, so next (no recursion and no state mutation)
# solution = [1], now try [2,3]
# solution = [1,2] yes promising so add to solution and recurse into this

# now for solution = [1,2], try [1,2,3]
# 1 is already in there next (no recursion and no state mutation)
# 2 is already in there next (no recursion and no state mutation)
# 3 is promising, so add and recurse
# solution = [1,2,3], add to result
# we were in our last item in the loop for solution = [1,2]

# @param {Integer[]} nums
# @return {Integer[][]}
def permute nums
  permute_helper nums, result=[], []
  result
end

def permute_helper nums, result, permutation
  return result << permutation.clone if permutation.length == nums.length

  nums.each do |num|
    next if permutation.include? num
    permutation << num
    permute_helper nums, result, permutation
    permutation.pop
  end
end

permute [1,2,3]

