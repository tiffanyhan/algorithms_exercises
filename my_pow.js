/**
 * @param {number} x
 * @param {number} n
 * @return {number}
 */

// i wonder if the exponent can be a negative number? => yes
  // if the exponent is negative, 1 / result
// whats the base case?
  // seems the number should be returned when exponent == 1
// how to reduce into subproblems?
  // 2^3 => 2 * 2^2.. etc
  // need to remember and decrement the exponent on each recursive call

// whats the naive implementation?
// try a non tail recursive solution

// works! now try a tail recursive solution
  // need to store the value of x in an accumulator and keep mutating it
  // and passing it around
  // do i need a helper for this?

// var acc;

// var myPow = function(x, n) {
//   acc *= x;

//   if (n === 0) return 1;
//   if (n === 1) return acc;

//   var absN = n > 0 ? n : 0 - n;
//   var result = myPow(x, absN - 1);

//   if (n < 0) result = 1 / result;
//   return result;
// };

// console.log(myPow(5, 0)) // 1
// acc = 1;
// console.log(myPow(5, 1)) // 5
// acc = 1;
// console.log(myPow(2, 3)) // 8
// acc = 1;
// console.log(myPow(1, 20)) // 1
// acc = 1;
// console.log(myPow(0, 20)) // 0
// acc = 1;
// console.log(myPow(-2, 3)) // -8
// acc = 1;
// console.log(myPow(2, -3)) // .125
// acc = 1;
// console.log(myPow(1.00001, 123456)) //
// acc = 1;

// seems like the function env needs to be held in memory, bc
// of our extra processing at the end if the exponent is negative
  // perhaps it would be better to have two disjunctive logical branches
  // for a positive exp and a negative exp?

// var myPow = function(x, n) {
//   if (n === 0) return 1;
//   if (n  <  0) return myPowNeg(x, -n);
//   if (n  >  0) return myPowPos(x,  n);
// };

// function myPowPos(x, n, acc=1) {
//   acc *= x;
//   if (n === 1) return acc;

//   return myPowPos(x, n - 1, acc);
// }

// function myPowNeg(x, n, acc=1) {
//   acc *= x;
//   if (n === 1) return 1 / acc;

//   return myPowNeg(x, n - 1, acc);
// }

function myPow(x, n) {
  if (n === 0) return 1;
  if (n < 0) {
    n = -n;
    x = 1 / x;
  }

  halfN = Math.floor(n / 2);
  return n % 2 === 0 ? myPow(x * x, halfN) : x * myPow(x * x, halfN);
}

console.log(myPow(5, 0)) // 1
console.log(myPow(5, 1)) // 5
console.log(myPow(2, 3)) // 8
console.log(myPow(1, 20)) // 1
console.log(myPow(0, 20)) // 0
console.log(myPow(-2, 3)) // -8
console.log(myPow(2, -3)) // .125
console.log(myPow(1.00001, 123456)) //

// acc = 1;

// 2^3
// if n is neg, make n positive and flip x
// is the exponent odd or even?
  // if even: myPow(x*x, n / 2)
  // if odd: x * myPow(x*x, n/2) => why is that x outside?

// the exponent isnt decremented, it's divided in 1/2!! (INTEGER division)
// my solution was recursion + linear, this one is recursion + logN

// 2^3
// 2 * myPow(2*2, 3/2)
// 2 * myPow(4, 1)
// 2 * (4 * myPow(0))
// 2 * (4 * 1)
// 8

// 2^4
// myPow(2*2, 4/2)
// myPow(4, 2)
// myPow(4*4, 2/2)
// myPow(16, 1)
// 16 x myPow(0)
// 16 x 1
// 16

// whats the implicit knowledge here?
  // we are trying to decrease n by increasing x
  // just need to find the pattern by which we can do this
  // base case: have smallest exp possible + largest num possible

// 2^2 == 4^1
// 2^4 == 16^1

// 2 * 2 * 2 * 2 becomes 16 * 1

// 2^3 == 2 * 4^1

// 2 * 2 * 2 becomes 4 * 1

// the odd case is almost parasitic off the even case,
// adds something on top of it
