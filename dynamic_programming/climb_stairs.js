//                     _
// step 4            _|
// step 3          _|
// step 2        _|
// step 1       |

// how many different ways can you get to step 4?
// - from step 3
// - from step 2

// how many different ways can you get to step 3?
// - from step 2
// - from step 1

// how many different ways can you get to step 2?
// - from step 1
// - from step 0

/**
 * @param {number} n
 * @return {number}
 */

// T: linear, bc you only look at prev 2 steps. 2 is always fixed.
// to process each node, there is a constant # of steps
// but you still have to visit each node

var climbStairs = function(n) {
  return helper(n);
};

function helper(n, cache={}) {
  if (n === 0 || n === 1) return 1;

  var allWaysToPrevStep     = cache[n - 1] || helper(n - 1, cache);
  var allWaysToPrevPrevStep = cache[n - 2] || helper(n - 2, cache);

  return cache[n] = allWaysToPrevStep + allWaysToPrevPrevStep;
}

// ===============================
// iterative traversal

var climbStairs = function(n) {
  var cache = [1, 1];

  for (var i = 2; i <= n; i++) {
    cache[i] = cache[i - 1] + cache[i - 2];
  }

  return cache[n];
};
