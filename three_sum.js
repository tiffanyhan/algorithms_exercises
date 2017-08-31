var threeSum = function(nums) {
  var result = [];
  nums.sort

  nums.forEach(function(num) {
    var complement = -num;
  });

  return result;
};

function twoSum(numbers, target) {
  var complement;
  var h = {};

  for (var i = 0; i < numbers.length; i++) {
    complement = target - numbers[i];
    if (h[String(complement)] !== undefined) {
      return [i, h[String(complement)]].sort();
    } else {
      h[String(numbers[i])] = i;
    }
  }
}

console.log(twoSum([5, 75, 25], 100));
console.log(twoSum([5, 75, 25], 100) == [1, 2]);
console.log(twoSum([3, 2, 3], 6));
console.log(twoSum([3, 2, 3], 6) == [0, 2]);
console.log(twoSum([3, 3], 6) == [0, 1]);
console.log(twoSum([2, 7, 11, 15], 9) == [0, 1]);
console.log(twoSum([3, 2, 4], 6) == [1, 2]);

console.log(threeSum([-1, 0, 1, 2, -1, -4])); // [[-1, 0, 1], [-1, -1, 2]]
// [-4, -1, -1, 0, 1, 2]