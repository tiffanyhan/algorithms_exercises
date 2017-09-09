# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# a path for each leaf node up to the root
# divide and conquer?

# add one for each step down a path
# at the end, just take the max num

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 if !root

  left_depth  = max_depth(root.left)  + 1
  right_depth = max_depth(root.right) + 1

  greater_depth = left_depth > right_depth ? left_depth : right_depth
  greater_depth
end
