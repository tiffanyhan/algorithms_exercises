var nextGreaterElement = function(findNums, nums) {
  var nextGreater = {};
  var stack = [];

  for (var i = 0; i < nums.length; i++) {
    if (stack.length === 0 || nums[i] < stack[stack.length - 1]) {
      stack.push(nums[i]);
    } else {
      while (stack[stack.length - 1] < nums[i]) {
        nextGreater[stack.pop()] = nums[i];
      }
      stack.push(nums[i]);
    }
  }

  for (i = 0; i < findNums.length; i++) {
    findNums[i] = nextGreater[findNums[i]] ? nextGreater[findNums[i]] : -1;
  }

  return findNums;
};

console.log(nextGreaterElement([4,1,2], [1,3,4,2])); // [-1,3,-1]
// [1] 3 > 1, so 3
// [3] 4 > 3, so 4
// [4] ran out of numbers, so -1
console.log(nextGreaterElement([1,3,5,2,4], [6,5,4,3,2,1,7])); // [7,7,7,7,7]
// [6,5,4,3,2,1] 7 > 1, so 7