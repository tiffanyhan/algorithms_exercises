var isPalindrome = function(s) {
  if (s.length === 0) return true;

  var left = 0;
  var right = s.length - 1;

  while (left < right) {
    while (left < right && !/[a-z0-9]/i.test(s[left])) {
      left++;
    }

    while (left < right && !/[a-z0-9]/i.test(s[right])) {
      right--;
    }

    if (s[left].toLowerCase() !== s[right].toLowerCase()) {
      return false;
    }

    left++;
    right--;
  }

  return true;
};

console.log(isPalindrome('.,')) // true
console.log(isPalindrome("`l;`` 1o1 ??;l`")) // true
console.log(isPalindrome('a.')) // true
