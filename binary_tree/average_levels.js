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

//   return vals.map(function(level) {
//     return level.reduce(function(sum, val) {
//       return sum + val;
//     }, 0) / level.length;
//   });
// };

// solution without built in methods
// don't need to process root, bc the average is always just 1 value
// just put root's children into the queue

// at this point, we have 2 values in the queue
// nothing in nextLevel

// dequeue 9, process it (add it to levelTotal, increment length)
// push its children into nextLevel (none)
// dequeue 20, process it (add it to levelTotal, increment length)
// push its children into nextLevel (15, 7)

// when queue is empty, level is finished
// take levelTotal and divide it by length of level

// Input:

//     3
//    / \
//   9  20
//     /  \
//    15   7

// Output:

// [3, 14.5, 11]

var averageOfLevels = function(root) {
  var result    = [];
  var queue     = [];
  var nextLevel = [];
  var currLevel = {total: 0, size: 0};
  var current;

  if (root) {
    result.push(root.val);
    if (root.left)  queue.push(root.left);
    if (root.right) queue.push(root.right);
  }

  while (queue.length > 0) {
    current = queue.shift();
    currLevel.total += current.val;
    currLevel.size++;

    if (current.left)  nextLevel.push(current.left);
    if (current.right) nextLevel.push(current.right);

    if (queue.length === 0) {
      result.push(currLevel.total / currLevel.size);
      currLevel.total = 0;
      currLevel.size  = 0;
      queue = nextLevel;
      nextLevel = [];
    }
  }

  return result;
};

// function TreeNode(val) {
//   this.val = val;
//   this.left = this.right = null;
// }

// var node1 = new TreeNode(3);
// var node2 = new TreeNode(9);
// var node3 = new TreeNode(20);
// var node4 = new TreeNode(15);
// var node5 = new TreeNode(7);
// node1.left = node2;
// node1.right = node3;
// node3.left = node4;
// node3.right = node5;

// console.log(averageOfLevels(node1));
