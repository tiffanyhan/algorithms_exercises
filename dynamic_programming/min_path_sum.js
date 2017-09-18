/**
 * @param {number[][]} grid
 * @return {number}
 */
var minPathSum = function(grid) {
  var rows = grid.length;
  var cols = grid[0].length;
  var cache = [];

  if (rows === 0 || cols === 0) return;
  if (rows === 1 && cols === 1) return grid[0][0];

  for (var i = 0; i < rows; i++) {
    cache.push(new Array(cols).fill(undefined));
  }

  return helper(grid, rows - 1, cols - 1, cache);
};

// grid[rowIdx][colIdx]
function helper(grid, row, col, cache) {
  if (row === 0 && col === 0) return grid[0][0]; // base case

  var minSumTop;
  var minSumLeft;
  var minSum;

  if (row >= 0 && col - 1 >= 0)
    minSumTop  = cache[row][col - 1] || helper(grid, row, col - 1, cache);

  if (row - 1 >= 0 && col >= 0)
    minSumLeft = cache[row - 1][col] || helper(grid, row - 1, col, cache);

  if (minSumTop  === undefined || minSumLeft === undefined) {
    minSum = minSumTop === undefined ? minSumLeft : minSumTop;
  } else {
    minSum = minSumTop <= minSumLeft ? minSumTop  : minSumLeft;
  }

  return cache[row][col] = minSum + grid[row][col];
}

console.log(minPathSum([[1,2],[1,1]])); // 3
console.log(minPathSum([[0,0],[0,0]])); // 3

// iterative traversal
var minPathSum = function(grid) {
  var rows = grid.length - 1;
  var cols = grid[0].length - 1;

  var cache = {'0,0': grid[0][0]};

  for (var row = 0; row <= rows; row++) {
    for (var col = 0; col <= cols; col++) {
      if (row === 0 && col === 0) continue;

      var left = cache[[row, col - 1]];
      var top  = cache[[row - 1, col]];
      var min  = 0;

      if (left >= 0 && top >= 0) {
        min = Math.min(left, top);
      } else if (left >= 0) {
        min = left;
      } else if (top >= 0) {
        min = top;
      }

      var sum = grid[row][col] + min;
      cache[[row, col]] = sum;
    }
  }

  return cache[[rows, cols]];
};
