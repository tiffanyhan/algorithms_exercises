# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}

def invert_tree root
  return root unless root

  left_node  = invert_tree root.left
  right_node = invert_tree root.right

  root.left  = right_node
  root.right = left_node
  root
end

# preorder traversal approach

def invert_tree(root)
  return root unless root

  temp       = root.left
  root.left  = root.right
  root.right = temp

  invert_tree root.left  if root.left
  invert_tree root.right if root.right

  return root
end

# divide and conquer approach

# def invert_tree(root)
#   return root unless root

#   left, right = root.left, root.right

#   left_result  = invert_tree(left)
#   right_result = invert_tree(right)

#   # combine, everything before this is template

#   root.left  = right_result
#   root.right = left_result
#   root
# end
