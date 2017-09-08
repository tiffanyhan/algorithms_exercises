/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */

 //       1
 //      / \
 //     2   5
 //    / \   \
 //   3   4   6

 // 1
 //  \
 //   2
 //    \
 //     3
 //      \
 //       4
 //        \
 //         5
 //          \
 //           6

// preorder traversal:
// 1,2,3,4,5,6

// we want to do a preorder traversal while mutating

// if (!root) return

// left = root.left
// right = root.right

// root.right = root.left
// root.left = null

// recurse(left)
// recurse(right)

/**
 * @param {TreeNode} root
 * @return {void} Do not return anything, modify root in-place instead.
 */
var flatten = function(root) {
  function recurse(root) {
    if (!root) return;

    var left  = root.left;
    var right = root.right;

    if (prev) {
      prev.right = root;
      prev.left  = null;
    }

    prev = root;
    recurse(left);
    recurse(right);
  }

  var prev = null;
  recurse(root);
};
