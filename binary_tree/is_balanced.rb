# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# a tree is balanced if the height of its left and right subtrees never
# differ by more than one
# same goes for all of its subtrees

# naive divide and conquer, O(N^2)
# for each node, find max depth of left + max depth of right
#   find the difference btwn left and right
#   return false if the difference is more than 1

# return true

# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root, memo={prevDepth: 0})
  return true unless root

  left, right = root.left, root.right
  # order of conditionals optimized for short-circuiting
  is_balanced(left,  memo) &&
  is_balanced(right, memo) &&
  (max_depth(left) - max_depth(right)).abs <= 1
end

def max_depth(root)
  return 0 if !root

  left_depth  = max_depth(root.left)  + 1
  right_depth = max_depth(root.right) + 1

  greater_depth = left_depth > right_depth ? left_depth : right_depth
  greater_depth
end

# O(N) solution

def is_balanced(root)
  memo = { balanced: true }
  helper(root, memo)
  memo[:balanced]
end

def helper(root, memo)
  return 0 unless root
  return   unless memo[:balanced]

  left_depth      = helper(root.left, memo)  || return
  right_depth     = helper(root.right, memo) || return
  current_depth   = [left_depth, right_depth].max + 1

  if (left_depth - right_depth).abs > 1
    memo[:balanced] = false
  end

  current_depth
end
