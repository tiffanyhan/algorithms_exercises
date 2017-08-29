var isPerfectSquare = function(num) {
  if (num === 0 || num === 1) return true;

  var left = 1;
  var right = num;
  var mid;

  while (left + 1 < right) {
    mid = Math.floor(left + (right - left) / 2);

    if (mid * mid === num) {
      return true;
    } else if (mid * mid < num) {
      left = mid;
    } else {
      right = mid;
    }
  }

  if (left  * left  === num) return left;
  if (right * right === num) return right;

  return false;
};

console.log(isPerfectSquare(4)) // true
console.log(isPerfectSquare(9)) // true
console.log(isPerfectSquare(5)) // false

console.log(isPerfectSquare(81)) // true
console.log(isPerfectSquare(75)) // false
console.log(isPerfectSquare(16)) // true
console.log(isPerfectSquare(14)) // false
console.log(isPerfectSquare(1)) // true
console.log(isPerfectSquare(0)) // true
