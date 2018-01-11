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

Given an array of non-negative integers,
you are initially positioned at the first index
of the array.

Each element in the array represents your
maximum jump length at that position.

Determine if you are able to reach the last index.

For example:

A = [2,3,1,1,4], return true.
    [t,t,t,t,t]

A = [3,2,1,0,4], return false.
    [f,f,f,f,t]

# max jump length: current index + max jump length = new index,
#   means you can jump less than that too! so need to test
#   max and everything less than that down to 1.
#   early return if we can already reach a true index.
# edge case: numbers wont be negative but can be 0
#   zero means you cant move! are an automatic false

# input: array of numbers
# output: boolean, representing whether theres a path from start to end

# should i start from end or start?

# can i reach to the end from this index? what about this index?
# e.g.
# last index? yes
# last index - 1?
# last index - 2?
# etc.

# question: can i reach any index that can reach the end from here?
#   if index 0 is true, then return true. else return false.

# memo can be an array of booleans in each index position
#   prefill last index with true

# what is a recursive subproblem that models the problem?

# initialize memo with f
# e.g. [f,f,f,f,f,t]

# helper
#   return if index position < 0

#   from max jump length down to 1
#     current index plus jump length
#     check if resulting position is true position
#     if so, set memo to true and break

#   recurse, decrementing index by 1

# A = [2,3,1,1,4], return true.
#     [t,t,t,t,t]

# A = [3,2,1,0,4], return false.
#     [f,f,f,f,t]

def can_jump(nums)
  memo = Array.new(nums.length) { false }
  memo[memo.length - 1] = true
  can_jump_helper(nums, memo, nums.length - 2)
  p memo
  memo[0]
end

def can_jump_helper(nums, memo, index)
  return if index < 0

  max_jump_length = nums[index]

  max_jump_length.downto(1).each do |jump_length|
    can_jump = index + jump_length
    if memo[can_jump]
      memo[index] = true
      break
    end
  end

  can_jump_helper(nums, memo, index - 1)
end
