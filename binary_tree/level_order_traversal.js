/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */

//    3
// 9     20
//     15   7

// size of queue in the beginning is always 1
// dequeue 3, add its val to vals[vals.length - 1]
// add 9 and 20 to nextLevel

// queue is now empty, done with first level
// add nextLevel stuff to queue

// dequeue 9, add its val to vals
// add its children to nextLevel (none)
// dequeue 20, add its val to vals[vals.length - 1]
// add its children to nextLevel

// queue is now empty, done with second level
// add nextLevel stuff to queue

// dequeue 15, add its val to vals[vals.length - 1]
// add its children to nextLevel (none)
// dequeue 7, add its val to vals[vals.length - 1]
// add its children to nextLevel (none)

//      1
//   2     3
// 4   5

/**
 * @param {TreeNode} root
 * @return {number[][]}
 */
var levelOrder = function(root) {
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

  return vals;
};
