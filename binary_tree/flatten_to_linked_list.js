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

 // recurse right
 // recurse left
 // process root

 // left is solved: 2 3 4
 // right is solved: 5 6
 // how do i assemble the root?
 // 2 is saved in left pointer
 // 5 is saved in right pointer
 // 1's left is null
 // 1's right points to 2
 // connect 2 to 5 6

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

// preorder traversal

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

// divide and conquer

 //       1
 //      / \
 //     2   5
 //    / \   \
 //   3   4   6


 //       1
 //      /
 //     2

 // recurse right
 // recurse left
 // process root

// postorder traversal, retains all links automatically. how?

var flatten = function(root, memo={prevNode: null}) {
  if (!root) return;

  flatten(root.right, memo);
  flatten(root.left,  memo);

  root.left = null;
  root.right = memo.prevNode;

  memo.prevNode = root;
};
