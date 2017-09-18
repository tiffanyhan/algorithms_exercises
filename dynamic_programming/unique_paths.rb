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
