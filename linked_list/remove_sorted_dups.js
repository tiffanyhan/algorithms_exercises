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

// iterative approach
// how to use running pointer w/o index access?
// this solution is almost identical to remove_item problem

var deleteDuplicates = function(head) {
  var dummy = new Node(null);
  dummy.next = head;

  var current = dummy;

  while (current.next) {
    if (current.next && current.val === current.next.val) {
      current.next = current.next.next;
    } else {
      current = current.next;
    }
  }

  return dummy.next;
};

// [null,1,1,2]
// current: 1 (first), current.next: 2
// [null,1,2]
// current: 2, current.next: null

var linkedList = new LinkedList();
linkedList.add(1);
linkedList.add(2);

console.log(deleteDuplicates(linkedList)); // [1,2]

linkedList = new LinkedList();
linkedList.add(1);
linkedList.add(1);
linkedList.add(2);
linkedList.add(3);
linkedList.add(3);
console.log(deleteDuplicates(linkedList)); // [1,2,3,4,5]
