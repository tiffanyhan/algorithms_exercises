# A robot is located at the top-left corner of a m x n grid
# (marked 'Start' in the diagram below).

# The robot can only move either down or right at any point in time.
# The robot is trying to reach the bottom-right corner of the grid
# (marked 'Finish' in the diagram below).

# How many possible unique paths are there?

# input: m (rows), n(cols)
# output: number, representing number of unique paths from start to end

# x x x x x x x
# x x x x x x x
# x x x x x x x

# represent as
# [
#   [x,x,x,x,x,x,x],
#   [x,x,x,x,x,x,x],
#   [x,x,x,x,x,x,x]
# ]

# start: rows=1, cols=1
# end: rows=3, cols=7
# invalid: col > 7, row > 3

# rows=2, cols=4
# x x x x
# x x x x

# paths(m, n)
#   if m == 0, return 0
#   if n == 0, return 0
#   if m == 1 && n == 1, return 1

#   if memo[row][col] doesnt yet exist, set it
#     memo[row][col] = paths(m - 1, n) + paths(m, n - 1)

#   return memo[row][col]

# create_memo
#   for row in rows
#     initialize [] and add it to outer array

def create_memo(rows)
  memo = []
  (rows + 1).times { |_| memo << []}
  memo
end

def unique_paths(m, n)
  memo = create_memo(m)
  helper(m, n, memo)
end

def helper(rows, cols, memo)
  return 0 if rows  < 1 || cols  < 1
  return 1 if rows == 1 && cols == 1

  unless memo[rows][cols]
    memo[rows][cols] = helper(rows - 1, cols, memo) + helper(rows, cols - 1, memo)
  end

  memo[rows][cols]
end

# iterative traversal

def unique_paths(row, column)
  # set to 0 based row and column
  row -= 1
  column -= 1

  cache = { [0, 0] => 1 }

  (0..column).each do |c|
    (0..row).each do |r|
      next if r == 0 && c == 0
      left = cache[[r, c - 1]] || 0
      top = cache[[r - 1, c]] || 0
      sum = left + top
      cache[[r, c]] = sum
    end
  end

  cache[[row, column]]
end
