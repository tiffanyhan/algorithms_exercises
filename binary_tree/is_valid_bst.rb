# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
      @val = val
      @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  return true if !root

  helper root.left, acc=[]

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
