# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  major = 0
  len   = nums.length
  mask  = 1

  (0..31).each do |bit|
    setCount = 0;

    (0..len - 1).each do |idx|
      setCount += 1 if nums[idx] & mask
      if setCount > len / 2
        major = major === 0 ? mask : major
         break;
      end
    end

    mask = mask << 1
  end

  major
end

puts majority_element [1] # 1
