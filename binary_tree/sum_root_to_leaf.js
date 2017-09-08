/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number}
 */

//     1        '' += 1 => '1'
//    / \
//   2   3      '1' += 2 => '1'
//  /\   /\
// 4  5 6  7    [1,2,4] [1,2,5] [1,3,6] [1,3,7]

// divide and conquer
// every time you split off into left and right,
// make a copy of the array and add to it.
// needs a helper?

var sumNumbers = function(root) {
  if (!root) return 0;
  var result = [];
  helper(root, result);
  return result.reduce(function(sum, int) { return sum + int; }, 0);
};

function helper(root, result, path='') {
  path += String(root.val);
  if (root.left)  helper(root.left,  result, path);
  if (root.right) helper(root.right, result, path);
  if (!root.left && !root.right) result.push(Number(path));
}
