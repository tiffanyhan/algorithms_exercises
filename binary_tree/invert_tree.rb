# recursively switch left and right

#      4
#    /   \
#   2     7
#  / \   / \
# 1   3 6   9
# to
#      4
#    /   \
#   7     2
#  / \   / \
# 9   6 3   1

#      4
#    /   \
#   2     7
#  / \   / \
# 3   1 9   6

#      4
#    /   \
#   7     2
#  / \   / \
# 9   6 3   1

def invert_tree(root)
  return nil unless root

  left_inverted  = invert_tree(root.left)
  right_inverted = invert_tree(root.right)

  root.left  = right_inverted
  root.right = left_inverted

  root
end

# preorder traversal approach ???

def invert_tree(root)
  return root unless root

  temp       = root.left
  root.left  = root.right
  root.right = temp

  invert_tree root.left  if root.left
  invert_tree root.right if root.right

  return root
end
