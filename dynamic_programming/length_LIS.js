// Given an unsorted array of integers, find the length of longest increasing subsequence.

// For example,
// Given [10, 9, 2, 5, 3, 7, 101, 18],
// The longest increasing subsequence is [2, 3, 7, 101],
// therefore the length is 4. Note that there may be more than
//  one LIS combination, it is only necessary for you to return the length.

// what's the subproblem?
// - find longest increasing subsequence ending at this index (inclusive)

// initialize all cache values with 1

// how to find cache[i]?

// keep a memo to store greatest # we can achieve
// by trying to append currVal to all vals at prev indices

// memo = 1

// loop thru 0..i - 1 (all prev indices before i)
//   is currVal > valAtPrevIdx?
//     if so, +1 to cache[prevIdx]
//       if the resulting val is > memo val, replace memo val with this val
//       else continue

//   finally, cache[i] is assigned to memo val

// array = [10, 9, 2, 5, 3, 7, 101, 18]
// cache = [1,  1, 1, 2, 2, 3, 4,   4]

// ** inner loop can be prev amounts too. follows template we've
// been using more closely

function lengthOfLIS(nums) {
  if (nums.length === 0) return 0;

  var cache = [1];
  var currVal;
  var prevVal;
  var prevLIS;
  var memo;

  for (var idx = 1; idx < nums.length; idx++) {
    currVal = nums[idx];
    memo    = 1;

    for (var prevIdx = 0; prevIdx < idx; prevIdx++) {
      prevVal = nums[prevIdx];
      prevLIS = cache[prevIdx];

      if (currVal > prevVal) {
        // keep the max every time
        memo = Math.max(memo, prevLIS + 1);
      }
    }

    cache[idx] = memo;
  }

  return Math.max.apply(null, cache);
}

function lengthOfLIS(nums) {
  if (nums.length === 0) return 0;

  var cache = [1];
  var memo;

  for (var idx = 1; idx < nums.length; idx++) {
    memo = 1;

    for (var prevIdx = 0; prevIdx < idx; prevIdx++) {
      if (nums[idx] > nums[prevIdx] && cache[prevIdx] + 1 > memo) {
        memo = cache[prevIdx] + 1;
      }
    }

    cache[idx] = memo;
  }

  return Math.max.apply(null, cache);
}
