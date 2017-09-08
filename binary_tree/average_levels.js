/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */

// for each subarray in vals, reduce it to the avg

/**
 * @param {TreeNode} root
 * @return {number[]}
 */

var averageOfLevels = function(root) {
  var vals      = [];
  var queue     = [];
  var nextLevel = [];
  var current;

  if (root) {
    vals.push([]);
    queue.push(root);
  }

  while (queue.length > 0) {
    current = queue.shift();
    vals[vals.length - 1].push(current.val);
    if (current.left)  nextLevel.push(current.left);
    if (current.right) nextLevel.push(current.right);

    if (queue.length === 0 && nextLevel.length > 0) {
      vals.push([]);
      queue = nextLevel;
      nextLevel = [];
    }
  }

  return vals.map(function(level) {
    return level.reduce(function(sum, val) {
      return sum + val;
    }, 0) / level.length;
  });
};
