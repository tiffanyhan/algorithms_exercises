var removeDuplicates = function(nums) {
  var i = 0;
  for (var j = 1; j < nums.length; j++) {
    if (nums[i] !== nums[j]) {
      i++;
      nums[i] = nums[j];
    }
  }
  return i + 1;
};

console.log(removeDuplicates([0, 0, 0])); // [0].length = 1
console.log(removeDuplicates([1, 1, 1])); // [1]
console.log(removeDuplicates([1, 1, 2])); // [1,2]
console.log(removeDuplicates([1, 2])); // [1,2]