require 'pry'

# a non recursive binary search version

# def search_range(nums, target)
#   start_range = nil
#   end_range = nil

#   left = 0
#   right = nums.length - 1

#   while left + 1 < right
#     mid = left + (right - left) / 2
#     if nums[mid] >= target
#       right = mid
#     else nums[mid] < target
#       left = mid
#     end
#   end

#   if nums[left] == target
#     start_range = left
#   elsif nums[right] == target
#     start_range = right
#   else
#     return [-1, -1]
#   end

#   left = 0
#   right = nums.length - 1

#   while left + 1 < right
#     mid = left + (right - left) / 2
#     if nums[mid] <= target
#       left = mid
#     elsif nums[mid] > target
#       right = mid
#     end
#   end

#   end_range = nums[right] == target ? right : left
#   return [start_range, end_range]
# end

# puts search_range([5,7,7,8,8,10], 8); # [3,4]
# puts search_range([2,2], 2); # [0,1]
# puts search_range([5,7,7,8,8,10], 1); # [-1,-1]

# a recursive binary search version

def search_range(nums, target)
  return [-1, -1] if nums.empty? || !target

  start_range = find_start nums, target, 0, nums.length - 1
  return [-1, -1] if start_range == -1

  end_range = find_end nums, target, 0, nums.length - 1
  return [start_range, end_range]
end

# base case is when left and right are adjacent
# how to reduce?
  # calculate the mid, compare target to mid
  # throw away half based on comparison
  # only call self with the kept half

def find_start nums, target, left, right
  if left + 1 >= right
    return left  if nums[left]  == target
    return right if nums[right] == target
    return -1
  end

  mid = left + (right - left) / 2

  if nums[mid] >= target
    right = mid
  else
    left = mid
  end

  find_start nums, target, left, right
end

def find_end nums, target, left, right
  if left + 1 >= right
    return right if nums[right] == target
    return left  if nums[left]  == target
    return -1
  end

  mid = left + (right - left) / 2
  if nums[mid] <= target
    left = mid
  else
    right = mid
  end

  find_end nums, target, left, right
end

puts search_range([5,7,7,8,8,10], 8); # [3,4]
puts search_range([2,2], 2); # [0,1]
puts search_range([5,7,7,8,8,10], 1); # [-1,-1]
puts search_range([1], 2); # [-1,-1]
puts search_range([1], 1); # [0, 0]
puts search_range([], 2); # [-1, -1]

