/**
 * @param {number} m
 * @param {number} n
 * @return {number}
 */

//  [ ][ ]
//  [ ][ ]

//  helper(1, 1)
//  allPathsFromTop = helper(0, 1)
//   allPathsFromTop = 0
//   allPathsFromLeft = 1
//   return 0 + 1;

//  allPathsFromLeft = helper(1, 0)
//    allPathsFromTop = 1
//    allPathsFromLeft = 0
//    return 1 + 0;

// return 1 + 1;

var uniquePaths = function(rows, cols) {
  var cache = [];
  for (var i = 0; i < rows; i++) {
    cache.push([]);
  }

  return helper(rows - 1, cols - 1, cache);
};

function helper(row, col, cache) {
  if (row === 0 && col === 0) return 1;

  var allPathsFromTop;
  var allPathsFromLeft;

  if (row - 1 >= 0 && col >= 0) {
    allPathsFromTop = cache[row - 1][col] || helper(row - 1, col, cache);
  } else {
    allPathsFromTop = 0;
  }

  if (row >= 0 && col - 1 >= 0) {
    allPathsFromLeft = cache[row][col - 1] || helper(row, col - 1, cache);
  } else {
    allPathsFromLeft = 0;
  }

  return cache[row][col] = allPathsFromTop + allPathsFromLeft;
}
