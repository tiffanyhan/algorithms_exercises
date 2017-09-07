# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def preorder_traversal(root)
  acc = []
  helper root, acc
  return acc;
end

def helper(root, acc)
  return if !root
  acc << root.val
  helper(root.left, acc)
  helper(root.right, acc)
end