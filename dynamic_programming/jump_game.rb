# dp: over-lapping subproblems

# problem solving: how do I utilize previous sub-solutions to build solution for bigger (sub)problems?

# Question: Determine if you are able to reach the last index.

# ============================
# Step 0: Define Sub problems and previous sub problems
# ============================

# Sub problem(s): Determine if you are able to reach the i index, i in 0..(last index)
# Previous Sub problems: whether we can reach the j index, where j in 0..(i-1)

# ============================
# Step 1: Look into the relationship between subproblems
# ============================

# f(i) = f(0) && nums[0] >= (i-0) ||
#        f(1) && nums[1] >= (i-1) ||
#        f(2) && nums[2] >= (i-2) ||
#        ....
#        f(i-1) && nums[i-1] >= 1


# base: return true if i == 0

# f(i) = OR{f(j) && nums[j] >= (n-j)}, where j in 0..i-1

# ============================
# Step 2: WITHOUT Memoization
# ============================

# T: O(N!), w/o cacheing

def can_jump(nums)
  jump_helper(nums, num.size - 1)
end

def can_jump_helper(nums, current_index)
  return true if current_index == 0

  (0..current_index-1).each do |j|
    return true if (nums[j] >= (current_index - j) && can_jump_helper(j))
  end

  false
end

# ============================
# Step 3: Add Memoization
# ============================

# T: O(N^2), includes cacheing
# for every node, you have to look at all prev nodes
#   even if that step is O(1)

def can_jump(nums)
  can_jump_helper(nums, num.size - 1, {0 => true}) # so that we don't have to update cache for the base case in helper
end

def can_jump_helper(nums, current_index, memo)
  return true if current_index == 0

  (0..current_index-1).each do |j|
    next unless nums[j] >= current_index - j
    if memo[j] || can_jump_helper(j)
      memo[current_index] = true
      return true
    end
  end

  memo[current_index] = false
end

# ===============================
# iterative traversal

def can_jump(nums)
  cache = [true]

  (0..nums.length - 1).each do |position|
    next unless cache[position]
    furthest_index_reachable = [nums[position] + position, nums.length - 1].min

    (position + 1..furthest_index_reachable).each do |index|
      cache[index] = true
    end
  end

  !!cache[nums.length - 1]
end
