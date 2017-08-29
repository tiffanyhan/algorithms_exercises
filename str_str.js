var strStr = function(haystack, needle) {
  if (needle.length === 0) return 0;

  array = haystack.split('');

  for (var i = 0; i < haystack.length; i++) {
    if (haystack.substr(i, needle.length) === needle)
      return i;
  }

  return -1;
};

console.log(strStr('a', '')) // 0
console.log(strStr('', 'a')) // -1
console.log(strStr('aaa', 'aa')) // 0