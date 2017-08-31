// 0 124567
// 124567 0

// if right < mid, then you know the rotated part is on the right
// left = mid

// 01 24567
// 24567 01

// if right < mid, then you know the rotated part is on the right
// left = mid

// 012 4567
// 4567 012

// if right < mid, then you know the rotated part is on the right
// left = mid

// 0124 567
// 567 0124

// if (right > mid) && (mid - 1 > mid), youre on the rotated part you have the min!
// return mid

// 01245 67
// 67 01245

// if (right > mid), youre on the rotated part and the min is to your left
// right = mid

// 012456 7
// 7 012456

// if (right > mid), youre on the rotated part and the min is to your left
// right = mid

var findMin = function(nums) {
  if (nums[nums.length - 1] >= nums[0]) return nums[0];

  var left = 0;
  var right = nums.length - 1;
  var mid;

  while (left + 1 < right) {
    mid = Math.floor(left + (right - left) / 2);

    if (nums[mid] > nums[right]) {
      left = mid;
    } else if (nums[mid] < right && nums[mid - 1] > nums[mid]) {
      // how to do it w/o this extra comparison ?
      return nums[mid];
    } else {
      right = mid;
    }
  }

  if (nums[left] < nums[right]) return nums[left];
  return nums[right];
};

console.log(findMin([4,5,6,7,0,1,2])) // 0
console.log(findMin([1])) // 1
console.log(findMin([1,2])) // 1
console.log(findMin([2,1])) // 1
