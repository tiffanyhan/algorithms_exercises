function Node(data) {
  this.val = data;
  this.next = null;
};

function LinkedList() {
  // head will be the top of the list
  // we'll define it as null for now
  this.head = null;
  this.length = 0;

    this.add = function(data) {
    var nodeToAdd = new Node(data),
        nodeToCheck = this.head;
    // if the head is null
    if(!nodeToCheck) {
      this.head = nodeToAdd;
      this.length++;
      return nodeToAdd;
    }
    // loop until we find the end
    while(nodeToCheck.next) {
      nodeToCheck = nodeToCheck.next;
    }
    // once were at the end of the list
    nodeToCheck.next = nodeToAdd;
    this.length++;
    return nodeToAdd;
  }
}

// T: O(N), S: O(N) iterative approach

// var reverseList = function(head) {
//   var dummy = new Node(null);
//   dummy.next = head;

//   var current = dummy;
//   var array = [];

//   while (current.next) {
//     array.unshift(current.next.val);
//     current = current.next;
//   }

//   current = dummy;

//   while (current.next) {
//     current.next.val = array.shift();
//     current = current.next;
//   }

//   return dummy.next;
// };

// T: O(N), S: O(1)

// 1=>2=>3=>4=>5=>6
// 1<=2<=3<=4<=5<=6
// return 6

var reverseList = function(head) {
  var prev = null;
  var current = head;
  var temp;

  while (current) {
    temp = current.next;
    current.next = prev;
    prev = current;
    current = temp;
  }

  return prev;
};

// recursive approach
// what's the base case?
// when you get to the last node


// function reverseList(head) {
//   if (!head)      return null;
//   if (!head.next) return head;

//   tailHead = reverseList(head.next);
//   head.next.next = head;
//   head.next = null;
//   return tailHead;
// }

// [1,2,3,4,5,6,null]
// [5,6,null]
// reverseList(6) => 6

// reverseList(5)
// tailHead = 6
// [5,6,null] => [5,null,5]
// return 6

// reverseList(4)
// tailHead = 6
// [4,5,null,5] => [4,null,4,5]

// Node { val: 5, next: Node { val: 6, next: null } }
// =>
// Node { val: 5, next: null }

// Node { val: 4, next: Node { val: 5, next: null } }
// =>
// Node { val: 4, next: null }

// Node { val: 3, next: Node { val: 4, next: null } }
// =>
// Node { val: 3, next: null }

// Node { val: 2, next: Node { val: 3, next: null } }
// =>
// Node { val: 2, next: null }

// Node { val: 1, next: Node { val: 2, next: null } }
// =>
// Node { val: 1, next: null }

// Node {
//   val: 6,
//   next: Node { val: 5, next: Node { val: 4, next: [Object] } } }

var linkedList = new LinkedList();
linkedList.add(1);
linkedList.add(2);
linkedList.add(3);
linkedList.add(4);
linkedList.add(5);
linkedList.add(6);
console.log(reverseList(linkedList.head)); // [6,5,4,3,2,1]

// linkedList = new LinkedList();
// linkedList.add(1);
// linkedList.add(2);
// console.log(reverseList(linkedList.head)); // [2,1]
