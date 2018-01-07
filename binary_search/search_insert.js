// Given a sorted array and a target value,
// return the index if the target is found. If not,
// return the index where it would be if it were inserted in order.

// You may assume no duplicates in the array.

// Here are few examples.
// [1,3,5,6], 5 → 2
// [1,3,5,6], 2 → 1
// [1,3,5,6], 7 → 4
// [1,3,5,6], 0 → 0

// binary search
// return index when found
// else if not found, return mid

function searchInsert(nums, target) {
  if (target < nums[0])               return 0;
  if (target > nums[nums.length - 1]) return nums.length;
  return binarySearch(nums, target, 0, nums.length - 1);
}

function binarySearch(nums, target, low, high) {
  var mid = low + Math.floor((high - low) / 2);

  while (low + 1 < high) {
    if (nums[mid] === target) {
      return mid;
    } else if (nums[mid] > target) {
      return binarySearch(nums, target, low, mid);
    } else {
      return binarySearch(nums, target, mid, high);
    }
  }

  if (nums[low]  === target) return low;
  if (nums[high] === target) return high;
  return mid + 1;
}

console.log(searchInsert([1,3,5], 1));
