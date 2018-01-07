# generic template, not the leetcode problem

def level_order_traverse(root)
  next_level = []
  curr_level = [root]

  loop do
    while !curr_level.empty?
      current = curr_level.first
      next_level << current.left  if current.left # adding children
      next_level << current.right if current.right
      curr_level.shift # dequeue first in line
    end

    break if next_level.empty? # no more levels left! curr_level had no children
    curr_level = next_level # else go to next level
    next_level = [] # and reset everything
  end
end
