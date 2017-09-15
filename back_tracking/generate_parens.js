/**
 * @param {number} n
 * @return {string[]}
 */
var generateParenthesis = function(n) {
  var result = [];
  helper(result, '', n, 0, 0);
  return result;
};

// how to keep track of valid parens state?
  // balanced = 0
  // +1 if adding (
  // -1 if adding )

  // total # of ( cannot be more than max_pairs

function helper(result, combo, max_pairs, balanced=0, open_total=0) {
  if (open_total > max_pairs || balanced < 0) return;
  if (combo.length === max_pairs * 2)         return result.push(combo);

  helper(result, combo + '(', max_pairs, balanced + 1, open_total + 1);
  helper(result, combo + ')', max_pairs, balanced - 1, open_total    );
}
