# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
      @val = val
      @left, @right = nil, nil
  end
end

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
