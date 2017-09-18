// cache = [0, Infinity, Infinity, Infinity, etc...]

// base case is amount 0
// how many ways does it take to make amount 0? 0 ways
// E.g. amount=6
// loop thru amount=1 to amount=6
  // loop thru each coinAmounts available
    // skip if coinAmount > currAmount

    // subtract currrent coinAmount from current amount
    // difference remaining is the amount you will use to query cache for
    // cache[difference] => min # of ways to get the difference remaining
    //   +1 to this val (to account for the initial subtraction)
    // take min(cache[amount], valJustCalculated)

  // return cache[amount]. if that val is Infinity, return -1.

function coinChange(coins, amount) {
  var cache = new Array(amount + 1).fill(Infinity);
  cache[0] = 0;

  var coinAmount;
  var diffRemaining;
  var currMinWays;

  for (var currAmount = 1; currAmount <= amount; currAmount++) {
    for (var coinIdx = 0; coinIdx < coins.length; coinIdx++) {
      coinAmount = coins[coinIdx];

      if (coinAmount > currAmount) continue;

      diffRemaining       = currAmount - coinAmount;
      minWaysWithCurrCoin = cache[diffRemaining] + 1;
      cache[currAmount]   = Math.min(cache[currAmount], minWaysWithCurrCoin);
    }
  }

  return cache[amount] === Infinity ? -1 : cache[amount];
}
