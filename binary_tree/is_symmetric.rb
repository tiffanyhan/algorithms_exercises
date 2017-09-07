# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# define symmetric in computational terms
# it is symmetric when at each level, it is the same
# forwards and backwords (like a palindrome)

# how to separate each "palindrome" though?
# would i need to calculate depth to no how to split them?
       1
   2       2
 3   4   4   3
9 7 6 5 5 6 7 9

       1

# symmetric if root and no left or right

       1
   2       2

# symmetric if root and root.left == root.right

       1
   2       2
 3   4   4   3

 # root.left == root.right &&
 # root.left.left == root.right.right &&
 # root.left.right == root.right.left

       1
   2       2
 3   4   4   3
9 7 6 5 5 6 7 9






# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  return true unless root
  is_mirror root.left, root.right
end

def is_mirror(left_node, right_node)
  return true  if !left_node && !right_node
  return false if !left_node || !right_node

  left_node.val == right_node.val &&
  is_mirror(left_node.left, right_node.right) &&
  is_mirror(left_node.right, right_node.left)
end
