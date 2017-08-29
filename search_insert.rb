# return the target index, else return right

require 'pry'

def search_insert(nums, target)
  return nums.length if target > nums[nums.length - 1]
  return 0           if target < nums[0]

  binary_search(nums, target)
end

def binary_search(array, target)
  left = 0
  right = array.length - 1

  while left + 1 < right
    mid = left + (right - left) / 2
    if array[mid] == target
      return mid
    elsif array[mid] < target
      left = mid
    else
      right = mid
    end
  end

  return left if array[left] == target
  return right if array[right] == target

  right
end

puts search_insert([1,3,5,6], 5) #2
puts search_insert([1,3,5,6], 2) #1
puts search_insert([1,3,5,6], 7) #4
puts search_insert([1,3,5,6], 0) #0