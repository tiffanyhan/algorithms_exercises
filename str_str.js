// O(MN) M is the length of the needle
// purpose is to make you think of edge cases

var strStr = function(haystack, needle) {
  if (needle.length === 0) return 0;

  var anchor = 0;
  var runner = 0;
  var count;
  var match;

  while (anchor <= haystack.length - needle.length) {
    count = 0;
    match = true;

    while (count <= needle.length - 1) {
      if (haystack[runner + count] !== needle[count]) {
        match = false;
        break;
      }
      count += 1;
    }

    if (match) return anchor;

    anchor++;
    runner++;
  }

  return -1;
};

console.log(strStr('a', '')) // 0
console.log(strStr('', 'a')) // -1
console.log(strStr('aaa', 'aa')) // 0