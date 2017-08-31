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

var reverseList = function(head) {
  var dummy = new Node(null);
  dummy.next = head;

  var current = dummy;
  var array = [];

  while (current.next) {
    array.unshift(current.next.val);
    current = current.next;
  }

  current = dummy;

  while (current.next) {
    current.next.val = array.shift();
    current = current.next;
  }

  return dummy.next;
};

var linkedList = new LinkedList();
linkedList.add(1);
linkedList.add(2);
linkedList.add(3);
linkedList.add(4);
linkedList.add(5);
linkedList.add(6);
console.log(reverseList(linkedList.head)); // [6,5,4,3,2,1]
