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
    cache.push([]);
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
