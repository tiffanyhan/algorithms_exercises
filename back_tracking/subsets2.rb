# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup nums
  nums.sort!
  subsets_helper nums, result={}, [], 0
  result.keys
end

def subsets_helper nums, result, subset, start
  result[subset.clone] = 1 if !result[subset.clone]

  (start..nums.size - 1).each do |idx|
    subset << nums[idx]
    subsets_helper(nums, result, subset, idx + 1)
    subset.pop
  end
end
