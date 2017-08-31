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

// iterative approach, this iterates through 0..next to last node
// each iteration, we check the next node to see if we want to delete
// if yes, we change current.next to the one after

// if the first node is the target, then return head's next node?
// else always return first node

// if we're on the 2nd to last node, and we see the last node is
// the target, then we simply make the current node's next = null

// if node to be deleted is not first or last,
// next jumps over the deleted node

var removeElements = function(head, val) {
  var dummy = new Node(null);
  dummy.next = head;

  var current = dummy;

  while (current.next) {
    if (current.next.val === val) {
      current.next = current.next.next;
    } else {
      current = current.next;
    }
  }

  return dummy.next;
};

// [null, 1, 2, 2, 1], 2
// [null, 1, 2, 1], 2

// var linkedList = new LinkedList();
// linkedList.add(1);
// linkedList.add(2);
// linkedList.add(3);
// linkedList.add(4);
// linkedList.add(5);
// linkedList.add(6);

// console.log(removeElements(linkedList.head, 6)); // [1,2,3,4,5]
// console.log(removeElements(linkedList.head, 1)); // [2,3,4,5]

// var linkedList = new LinkedList();
// linkedList.add(1);
// linkedList.add(2);
// linkedList.add(6);
// linkedList.add(3);
// linkedList.add(4);
// linkedList.add(5);
// linkedList.add(6);
// console.log(removeElements(linkedList.head, 6)); // [1,2,3,4,5]

var linkedList = new LinkedList();
linkedList.add(1);
linkedList.add(1);
console.log(removeElements(linkedList.head, 1)) // []

var linkedList = new LinkedList();
linkedList.add(1);
linkedList.add(1);
linkedList.add(1);
console.log(removeElements(linkedList.head, 1)) // []
