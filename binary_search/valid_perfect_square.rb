# Given a positive integer num, write a function which returns
# True if num is a perfect square else False.

# Note: Do not use any built-in library function such as sqrt.

# Example 1:

# Input: 16
# Returns: True
# Example 2:

# Input: 14
# Returns: False

# perfect square means there is some n such that num = n * n
# start at midpoint, see if mid * mid == num
# if it is return True
# else keep going

# end return false

# what if number is 0 or 1?

# Binary Search
# T: O(logN), S: O(1)

# @param {Integer} num
# @return {Boolean}
def is_perfect_square num
  return true if num.zero?

  low  = 0
  high = num

  while low + 1 < high
    mid  = low + (high - low) / 2

    if mid * mid == num
      return true
    elsif mid * mid > num # look in left half
      high = mid
    else # look in right half
      low = mid
    end
  end

  return true if low  * low  == num
  return true if high * high == num
  false
end

puts is_perfect_square 16 # true
puts is_perfect_square 14 # false

