# 1231
# 3

# the mid is 2
# 2 is less than 3
# that means a peak must be to the right
# so left = mid

# 23210

# the mid is 2
# 2 is greater than 3
# that means the peak must be to the left
# so right = mid

require 'pry'

def find_peak_element(nums)
  left = 0
  right = nums.length - 1

  count = 0

  while left < right
    mid = left + (right - left) / 2
    if nums[mid] < nums[mid + 1]
      left = mid + 1
    else
      right = mid
    end
  end

  left
end

puts find_peak_element([1,2,3,1]) # index 2