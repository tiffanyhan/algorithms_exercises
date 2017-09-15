/**
 * @param {number[]} nums
 * @return {boolean}
 */

// A = [3,2,1,0,4], return false.
// start with 4
// can i get to 4 from 0? no
// can i get to 4 from 1? no
// can i get to 4 from 2? no
// can i get to 4 from 3? no
// return false

// A = [2,3,1,1,4], return true.
// start with 4

// can i get to idx5 from idx4? yes. save in cache
//   if not, try idx 3, 2, 1
// can i get to idx4 from idx3? yes. save in cache
//   if not, try idx 2, 1
// can i get to idx3 from idx2? yes. save in cache
//   if not, try idx 1
// can i get to idx1 from idx1? yes. save in cache

// true

// cache = [foridx0, foridx1, foridx2, foridx3, foridx4]

// branching
// A = [3,2,1,0,4], return false.

// iterative traversal with cache

var canJump = function(nums) {
  var target = nums.length - 1;
  var maxJump;
  var i = 0;

  while (i < target) {
    maxJump = nums[i];
    i += maxJump;
  }

  return i === target;
};

console.log(canJump([3,2,1,0,4])); // false
