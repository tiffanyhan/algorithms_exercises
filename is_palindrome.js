var isPalindrome = function(s) {
  if (typeof(s) !== 'string' || s.length === 0) {
    return true;
  }

  var pointerOne = 0;
  var pointerTwo = s.length - 1;
  var itemOne;
  var itemTwo;

  while (pointerOne < pointerTwo) {
    while (!isAlphanumeric(s[pointerOne])) {
      pointerOne++;
    }

    while (!isAlphanumeric(s[pointerTwo])) {
      pointerTwo--;
    }

    itemOne = s[pointerOne].toLowerCase();
    itemTwo = s[pointerTwo].toLowerCase();

    if (itemOne !== itemTwo) {
      return false;
    } else {
      pointerOne++;
      pointerTwo--;
    }
  }

  return true;
};

function isAlphanumeric(char) {
  if (!char) {
    return false;
  }

  return char.match(/[A-z0-9]/);
}

console.log(isPalindrome("") === true);
console.log(isPalindrome("A man, a plan, a canal: Panama") === true);
console.log(isPalindrome("race a car") === false);