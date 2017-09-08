/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */

 // root - add val to vals
 // add right node to stack
 // add left node to stack

 // pop stack - visit left node, becomes root
 // add right node to stack
 // add left node to stack

 // pop stack - visit left node, becomes root
 // no right node or left node
 // so return

/**
 * @param {TreeNode} root
 * @return {number[]}
 */
var preorderTraversal = function(root) {
  var vals  = [];
  var stack = [];
  var current;

  if (root) stack.push(root);

  while (stack.length > 0) {
    current = stack.pop();
    vals.push(current.val);
    if (current.right) stack.push(current.right);
    if (current.left)  stack.push(current.left);
  }

  return vals;
};
