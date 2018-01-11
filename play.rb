Given a m x n grid filled with non-negative numbers,
find a path from top left to bottom right which minimizes
the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.

Example 1:

[[1,3,1],
 [1,5,1],
 [4,2,1]]

[
  [1,4,5],
  [2,7,6],
  [6,15,7]
]

Given the above grid map, return 7. Because the path 1→3→1→1→1 minimizes the sum.

input: an array of arrays
output: an integer, representing the min sum of numbers along a way from start to end
edge case: numbers are all nonnegative, so can have 0. np just add to sum.
  given []? so return 0?

rows: outer array length
cols: any inner array length
moving right: rows, cols + 1
moving down: rows + 1, cols
start: 0,0
end: rows-1, cols-1

out of boundaries: if row < 0 or col <0

cache: array of arrays
initialize cache[start]

iterate thru the input from left to right, taking one row at a time
  min path sum is min path sum(top, left) + current val
  set cache[row,col]
in the end, return cache[start,end]

def min_path_sum(grid)
  rows  = grid.length    - 1
  cols  = grid[0].length - 1
  cache = { [0,0] => grid[0][0] }

  (0..rows).each do |row|
    (0..cols).each do |col|
      next if row == 0 && col == 0
      top  = cache[[row - 1, col]] || 0
      left = cache[[row, col - 1]] || 0
      min  = top < left ? top : left
      cache[[row,col]] = min + grid[row][col]
    end
  end

  cache[[rows,cols]]
end

