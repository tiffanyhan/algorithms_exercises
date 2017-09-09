# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
      @val = val
      @left, @right = nil, nil
  end
end

# true-
#     2
#    / \
#   1   3

# false-
#     1
#    / \
#   2   3

# is_valid 2, nil, nil

# is_valid 1, nil, 2
# on left subtree, val must be less than parent val (max)

# is_valid 3, 2, nil
# on right subtree, val must be greater than parent val (min)

# true-
#     5
#    / \
#   3   7
#  /\   /\
# 1  4  6 9

# true-
#     5
#    / \
#   3   7
#  /\   /\
# 1  6 1  9

# is_valid root=5, min=nil, max=nil

# is_valid root=3, min=nil, max=5
# on left subtree, val must be less than parent val (max=5)

# is_valid root=1, min=nil, max=3
# on left subtree, val must be less than parent val (max=3)

# is_valid root=4, min=3, max=5
# on an inner tree, both conditionals will apply
# val must be greater than min=3 and less than max=5

# is_valid root=7, min=5, max=nil
# on right subtree, val must be greater than parent val (min=5)

# divide and conquer solution
def is_valid_bst(root, min=nil, max=nil)
  return true if !root

  return false if (min && root.val <= min.val) || (max && root.val >= max.val)

  return is_valid_bst(root.left, min, root) && is_valid_bst(root.right, root, max)
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  helper root, acc=[]

  i = 1
  while i < acc.length
    return false if acc[i - 1] >= acc[i]
    i += 1
  end

  true
end

def helper(root, acc)
  return if !root

  helper root.left, acc
  acc.push root.val
  helper root.right, acc
end
