// Find the contiguous subarray within an array (containing at least one number) which has the largest sum.

// For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
// the contiguous subarray [4,-1,2,1] has the largest sum = 6.

// seems to be the same as partitioning a string:
// find all possible ways of partitioning the array

// subproblem: find the max subarray ending at this idx (inclusive)
// solution: return a single integer representing the sum of a contiguous
  // subarray that is greater than all others

// cache = [-2, 1, 1, 4]

// [-2, 1, -3, 4]
// [-2]              [-2], first idx set by default
// [-2, 1]           [1] , compare 1 and maxatPrevIdx = -2
// [-2, 1, -3]       [-2], compare -3 and maxAtPrevIdx = 1. **why -2 isntead of 1? bc it must END at that idx.
// [-2, 1, -3, 4]    [4] , compare 4 and maxAtPrevIdx = -2.

// [-2, 1, -2, 4].max

// loop goes from 1..nums.length - 1
  // set the cache for this idx

  // check if cached max of prev idx > 0
  // if it is, add to val at current idx
  // else, add 0.

  // if it's negative or 0, adding to current val
  // will decrease the # or have no effect
  // so only add if it increases the prev max
  // else the prev max is the max at current idx too

  // update global max so far

// return global max

/**
 * @param {number[]} nums
 * @return {number}
 */
var maxSubArray = function(nums) {
  var cache = [nums[0]];
  var max   = nums[0];

  for (var i = 1; i < nums.length; i++) {
    cache[i] = nums[i] + (cache[i - 1] > 0 ? cache[i - 1] : 0);
    max = Math.max(max, cache[i]);
  }

  return max;
};

// more semantic and easier to understand re-writing, but less efficient

var maxSubArray = function(nums) {
  var cache = [nums[0]];

  var maxAtPrevIdx;
  var currVal;
  var cumulativeSum;

  for (var currIdx = 1; currIdx < nums.length; currIdx++) {
    maxAtPrevIdx   = cache[currIdx - 1];
    currVal        = nums[currIdx];
    cache[currIdx] = maxAtPrevIdx + currVal > currVal ? maxAtPrevIdx + currVal : currVal
  }

  return Math.max.apply(null, cache);
};
