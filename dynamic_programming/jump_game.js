// Given an array of non-negative integers, you are initially positioned
// at the first index of the array.

// Each element in the array represents your maximum jump length at that position.

// Determine if you are able to reach the last index.

// For example:
// A = [2,3,1,1,4], return true.

// A = [3,2,1,0,4], return false.

// cache of booleans - represents whether you can reach here from start
// start at first idx
// cache initialized to [true], bc you can always get to idx 0 from idx 0
// loop thru 0..last index
//   next unless cache[index]

//   maxJumpLength = nums[currIndex]
//   minJumpPos    = currIndex + 1
//   maxJumpPos    = currIndex + maxJumpLength

//   loop thru minJumpPos..maxJumpPosition
//     cache[pos] = true

// return cache[nums.length - 1]

/**
 * @param {number[]} nums
 * @return {boolean}
 */

function canJump(nums) {
  var cache = [true];

  for (var index = 0; index < nums.length; index++) {
    if (!cache[index]) continue;

    for (var maxJump = 1; maxJump <= nums[index]; maxJump++) {
      cache[index + maxJump] = true;
    }
  }

  return !!(cache[nums.length - 1]);
}
