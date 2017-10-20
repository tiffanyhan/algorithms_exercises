# Given a binary tree, find the leftmost value in the last row of the tree.

#   2
#  / \
# 1   3

# output 1

#       1
#      / \
#     1   3
#   /    / \
# 4     5   6
#      /
#     7

# output 7

# DFS
# inorder

# left
# root
# right

# array = [nil, [1], [1,3], [4,5,6], [7]]
# memo = {depth: 1}

# queue      = [] # []
# curr_level = [root] # [7]

# curr_leftmost

# loop do
#   curr_leftmost = curr_level.first # 7

#   loop curr_level is not empty
#     add children to queue if child exists # curr_level []
#     shift curr_level
#   end

#   break we reached the last level if queue is empty
#   curr_level = queue
#   queue = []
# end

# curr_leftmost

def find_bottom_left_value(root)
  queue = []
  curr_level = [root]

  curr_leftmost = nil

  loop do
    curr_leftmost = curr_level.first

    while curr_level.length > 0
      queue << curr_level.first.left  if curr_level.first.left
      queue << curr_level.first.right if curr_level.first.right
      curr_level.shift
    end

    break if queue.empty?
    curr_level = queue
    queue = []
  end

  curr_leftmost.val
end