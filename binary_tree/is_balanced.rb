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
def is_balanced(root)
  return true if !root
  difference  = (max_depth(root.left) - max_depth(root.right)).abs
  difference <= 1 && is_balanced(root.left) && is_balanced(root.right)
end

def max_depth(root)
  return 0 if !root

  left_depth  = max_depth(root.left)  + 1
  right_depth = max_depth(root.right) + 1

  greater_depth = left_depth > right_depth ? left_depth : right_depth
  greater_depth
end
