def search_range(nums, target)
  start_range = nil
  end_range = nil

  left = 0
  right = nums.length - 1

  while left + 1 < right
    mid = left + (right - left) / 2
    if nums[mid] >= target
      right = mid
    else nums[mid] < target
      left = mid
    end
  end

  if nums[left] == target
    start_range = left
  elsif nums[right] == target
    start_range = right
  else
    return [-1, -1]
  end

  left = 0
  right = nums.length - 1

  while left + 1 < right
    mid = left + (right - left) / 2
    if nums[mid] <= target
      left = mid
    elsif nums[mid] > target
      right = mid
    end
  end

  end_range = nums[right] == target ? right : left
  return [start_range, end_range]
end

puts search_range([5,7,7,8,8,10], 8); # [3,4]
puts search_range([2,2]); # [0,1]
