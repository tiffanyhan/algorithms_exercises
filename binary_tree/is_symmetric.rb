require 'pry'

# For example, this binary tree [1,2,2,3,4,4,3] is symmetric:

    #        1
    #    /      \
    #   2        2
    #  / \      / \
    # 3  4     4   3
  #  /\  /\   /\   /\
  # 9 5 6  7 7  6 5  9
# But the following [1,2,2,null,3,null,3] is not:
#     1
#    / \
#   2   2
#    \   \
#    3    3

# child1 and child2 should be identical
# furthermore,
# child1's left should be a mirror of child2's right
# child1's right should be a mirror of child2's left

def is_symmetric(root)
  return true unless root
  is_mirror(root.left, root.right)
end

def is_mirror(child1, child2)
  return true  if (!child1 && !child2)
  return false if ( child1 && !child2) ||
                  (!child1 &&  child2)

  return false if child1.val != child2.val

  is_mirror(child1.left, child2.right) &&
  is_mirror(child1.right, child2.left)
end

# "palindrome solution"
# need to do a level order traversal
# each level becomes its own string
# after you finish constructing a string for the level,
# use 2 pointers to check if its a palindrome

# if not, early return
# else keep going

# fails when a tree has no nodes, but its neighbor does

def is_symmetric root
  queue = []
  queue << root if root

  while !queue.empty?
    level_size  = queue.size
    level_str   = ""

    while !level_size.zero?
      current_node = queue.shift
      level_str   << current_node.val.to_s

      if current_node.left
        queue << current_node.left
      elsif current_node.right
        queue << TreeNode.new(" ")
      end

      if current_node.right
        queue << current_node.right
      elsif current_node.left
        queue << TreeNode.new(" ")
      end

      level_size -= 1
    end
    binding.pry
    return false unless is_palindrome? level_str
  end

  true
end

# move two pointers closer and closer to mid
# stop when theyre on the same spot or past each other
# if left val != right val, return false
# else keep going
# if you reach the end, return true

def is_palindrome? str
  left = 0
  right = str.size - 1

  while left < right
    return false if str[left] != str[right]

    left  += 1
    right -= 1
  end

  true
end

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

node1 = TreeNode.new 1
node2 = TreeNode.new 2
node3 = TreeNode.new 2
node4 = TreeNode.new 3
node5 = TreeNode.new 3

node1.left  = node2
node1.right = node3
node2.right = node4
node3.left  = node5

puts is_symmetric node1
