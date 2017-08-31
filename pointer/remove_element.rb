require 'pry'

def remove_element(nums, val)
  pointer_one = 0
  pointer_two = 0

  until pointer_two == nums.length
    if nums[pointer_two] != val
      nums[pointer_one] = nums[pointer_two]
      pointer_one += 1
    end
    pointer_two += 1
  end

  pointer_one
end

p remove_element [3,2,2,3], 3