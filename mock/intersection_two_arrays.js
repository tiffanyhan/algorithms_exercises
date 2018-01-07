// Given two arrays, write a function to compute their intersection.

// Example:
// Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2].

// Note:
// Each element in the result must be unique.
// The result can be in any order.

// brute force

// T: O(N^3)

// figure out which array is shorter
// iterate thru that array,
//   check if item is also in other array &&
//   check if item is NOT in result array
//   if both, add to result
//   else next

// T: O(NlogN)

// sort both arrays
// iterate thru the shorter one,
//   next if the item is a duplicate of the last (edge case when on 1st item)
//   how to deal? just check if index is 0
//   binary search for the item in the other array, T: O(logN)

// hash map

// 11:20
