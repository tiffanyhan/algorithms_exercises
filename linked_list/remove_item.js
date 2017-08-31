// iterative approach, this iterates through 0..next to last node
// each iteration, we check the next node to see if we want to delete
// if yes, we change current.next to the one after

// if the first node is the target, then return head's next node?
// else always return first node

// if we're on the 2nd to last node, and we see the last node is
// the target, then we simply make the current node's next = null

// if node to be deleted is not first or last,
// next jumps over the deleted node

// var removeElements = function(head, val) {
//   var dummy = new Node(null);
//   dummy.next = head;

//   var current = dummy;

//   while (current.next) {
//     if (current.next.val === val) {
//       current.next = current.next.next;
//     } else {
//       current = current.next;
//     }
//   }

//   return dummy.next;
// };

// recursive approach
// use head-tail recursion
// head is the leading listNode
// tail is everything after that
// check if current head is equal to the val
// if so, simply call the fn again
// else append head + call the fn with tail

// what will calling the fn with tail return?
// if will return a node

// what's the base case?
// if !head.next, (means we're on the last node)
  // return null if head.value === val
  // return head otherwise

// how do you append the head to the tail?
// define a helper for this

var removeElements = function(head, val) {
  if (!head)      return null;
  if (!head.next) return head.val === val ? null : head;

  if (head.val === val) {
    return removeElements(head.next, val);
  } else {
    return append(head, removeElements(head.next, val));
  }
};

function append(head, tailHead) {
  head.next = tailHead;
  return head;
}

// console.log(removeElements([], 1)) // []

// linkedList = new LinkedList();
// linkedList.add(1);
// linkedList.add(1);
// console.log(removeElements(linkedList.head, 1)) // []

// linkedList = new LinkedList();
// linkedList.add(1);
// linkedList.add(1);
// linkedList.add(1);
// console.log(removeElements(linkedList.head, 1)) // []

// var linkedList = new LinkedList();
// linkedList.add(1);
// linkedList.add(2);
// linkedList.add(3);
// linkedList.add(4);
// linkedList.add(5);
// linkedList.add(6);

// console.log(removeElements(linkedList.head, 6)); // [1,2,3,4,5]
// console.log(removeElements(linkedList.head, 1)); // [2,3,4,5]

// linkedList = new LinkedList();
// linkedList.add(1);
// linkedList.add(2);
// linkedList.add(6);
// linkedList.add(3);
// linkedList.add(4);
// linkedList.add(5);
// linkedList.add(6);
// console.log(removeElements(linkedList.head, 6)); // [1,2,3,4,5]
