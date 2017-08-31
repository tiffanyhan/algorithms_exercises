require 'pry'

# whats the base case? empty string or length 1
# how to reduce into subproblems
  # first compare the outermost ends of the string
  # then compare whats left inside
# how to combine back again

# tail-recursive solution, only return true when we get to base case

def palindrome? string
  return true if string.empty? || string.length == 1
  return false if string[0] != string[string.length - 1]
  palindrome? string[1..string.length - 2]
end

# puts palindrome? 'madam' # true
# puts palindrome? 'racecar' # true
# puts palindrome? 'nadar' # false

# non tail-recursive solution

def palindrome? string
  return true if string.empty? || string.length == 1
  # return false if string[0] != string[string.length - 1]

  return (string[0] == string[string.length - 1]) &&
         (palindrome? string[1..string.length - 2])
end

# puts palindrome? 'madam' # true
# puts palindrome? 'racecar' # true
# puts palindrome? 'nadar' # false

# 'm' == 'm' && 'a' == 'a' && true
# 'r' == 'r' && 'a' == 'a' && 'c' == 'c' && true
# 'n' == 'r' && 'a' == 'a' && true, recursive calls won't happen bc of short-circuiting!

# how to recurse over the array?
  # try left/right halves method
# base case is when you reduce down to one element

# naive approach: use a global variable

# $max = -Float::INFINITY
# def find_max nums
#   if nums.length == 1
#     $max = nums.first if nums.first > $max
#     return
#   elsif nums.length > 1
#     mid = (nums.length - 1) / 2
#     left = nums[0..mid]
#     right = nums[mid + 1..nums.length - 1]
#   end

#   find_max left
#   find_max right

#   $max
# end

# puts find_max [5,7,0,1,0,-6,-3,10,2,2] # 10
# [5,7,0,1,0,-6,-3,10,2,2]
# [5,7,0,1,0], max
# [5,7,0] max
# [5,7] max
# [5] RETURN 5
# [7] RETURN 7
# [0]
# [1,0] max
# [-6,-3,10,2,2], max

# trying to avoid globals now

def find_max nums, max=-Float::INFINITY
  if nums.length == 1
    max = nums.first if nums.first > max
    return max
  elsif nums.length > 1
    mid = (nums.length - 1) / 2
    left = nums[0..mid]
    right = nums[mid + 1..nums.length - 1]
  end

  max = find_max left, max
  max = find_max right, max
  max
end

puts find_max [5,7,0,1,0,-6,-3,10,2,2] # 10
puts find_max [-5, 8] # 8

# returning an index requires a helper fn
# whats the base case?
  # reducing down to an array with 1 element
  # if that element is the target, return idx
# how to reduce?
  # try left/right again
# need to recombined?
  # seems like we can just return idx if its found
    # if no idx is found, return -1

def find_index nums, target
  idx = recurseHelper nums, target, 0, nums.length - 1
  return idx || - 1
end

# recurseHelper should take in extra arguments in order
# to help us retain knowledge of idx

def recurseHelper nums, target, left, right
  if left == right
    return left if nums[left] == target
    return
  end

  mid = left + (right - left) / 2
  idx = recurseHelper nums, target, left, mid
  return idx if idx
  idx = recurseHelper nums, target, mid + 1, right
end

puts find_index [5,7,0,1,0,-6,-3,10,2,2], 10 # 7
puts find_index [5,7,0,1,0,-6,-3,10,2,2], 100 # -1
puts find_index [-5, 8], 8 # 1
