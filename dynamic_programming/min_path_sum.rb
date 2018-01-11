# Given a m x n grid filled with non-negative numbers,
# find a path from top left to bottom right which minimizes
# the sum of all numbers along its path.

# Note: You can only move either down or right at any point in time.

# Example 1:

# [[1,3,1],
#  [1,5,1],
#  [4,2,1]]

# Given the above grid map, return 7.
# Because the path 1→3→1→1→1 minimizes the sum.

# input: grid, an array of arrays, with each inner array being a row
# output: a number, representing the min sum possible from one path from start to end
# edge case: grid can have 0, since it is non-negative. but it wont have negative numbers
#     will i ever get []? just return []

# [
#   [1,3],
#   [1,5]
# ]

# [1,3,5] = 9
# [1,1,5] = 7, so return 7

# minPath to here is: add my number to minPath from top,
#   add my number to minPath from left. take the min of those.
# base case: at 0,0 return number there
# out of bounds: return nil. will always get at least one valid number
#   from top or left. just take the valid number you get then.

# helper(grid, rows, cols)
#   if rows and cols are 0, then return the number
#   if either rows or cols < 0, then return nil

#   if min path from top or min path from left is not in memo
#     set it in memo

#   minPath = min(minPath from top + my number, minPath from left + my number),
#     checking for nil of minPath from top or minPath from left

def min_path_sum(grid)
  helper(grid, grid.length - 1, grid[0].length - 1, memo={})
end

def get_min(val1, val2)
  val1 < val2 ? val1 : val2
end

def populate_memo(grid, rows, cols, memo)
  unless memo[[rows - 1, cols]]
    memo[[rows - 1, cols]] = helper(grid, rows - 1, cols, memo)
  end

  unless memo[[rows, cols - 1]]
    memo[[rows, cols - 1]] = helper(grid, rows, cols - 1, memo)
  end
end

def helper(grid, rows, cols, memo)
  value_here = grid[rows][cols]

  return nil        if rows  < 0 || cols  < 0
  return value_here if rows == 0 && cols == 0

  populate_memo(grid, rows, cols, memo)

  min_path_from_top  = memo[[rows - 1, cols]]
  min_path_from_left = memo[[rows, cols - 1]]
  min_path_to_here   = nil

  min_path_to_here = if min_path_from_top.nil?
                       min_path_from_left
                     elsif min_path_from_left.nil?
                       min_path_from_top
                     else
                       get_min(min_path_from_top, min_path_from_left)
                     end

  min_path_to_here + value_here
end

# Given a m x n grid filled with non-negative numbers,
# find a path from top left to bottom right which minimizes
# the sum of all numbers along its path.

# Note: You can only move either down or right at any point in time.

# Example 1:

# [[1,3,1],
#  [1,5,1],
#  [4,2,1]]

# [
#   [1,4,5],
#   [2,7,6],
#   [6,15,7]
# ]

# Given the above grid map, return 7. Because the path 1→3→1→1→1 minimizes the sum.

# input: an array of arrays
# output: an integer, representing the min sum of numbers along a way from start to end
# edge case: numbers are all nonnegative, so can have 0. np just add to sum.
#   given []? so return 0?

# rows: outer array length
# cols: any inner array length
# moving right: rows, cols + 1
# moving down: rows + 1, cols
# start: 0,0
# end: rows-1, cols-1

# out of boundaries: if row < 0 or col <0

# cache: array of arrays
# initialize cache[start]

# iterate thru the input from left to right, taking one row at a time
#   min path sum is min path sum(top, left) + current val
#   set cache[row,col]
# in the end, return cache[start,end]

# [[1,3,1],
#  [1,5,1],
#  [4,2,1]]

def min_path_sum(grid)
  rows  = grid.length    - 1
  cols  = grid[0].length - 1
  cache = { [0,0] => grid[0][0] }

  (0..rows).each do |row|
    (0..cols).each do |col|
      next if row == 0 && col == 0
      top  = cache[[row - 1, col]] || Float::INFINITY
      left = cache[[row, col - 1]] || Float::INFINITY
      min  = top < left ? top : left
      cache[[row,col]] = min + grid[row][col]
    end
  end

  cache[[rows,cols]]
end
