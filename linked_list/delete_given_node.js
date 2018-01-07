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

// what are we given?
  // a node, its val, access to its next node
// how do we usually delete from linked list?
  // we use prev node, and make its next jump over one

// need to find another way
// alternative: change the value of that node to the next value
  // keep doing this until next value is null

// base case: we're on the last node
// must set to null
// then return

var deleteNode = function(node) {
  node.val = node.next.val
  node.next = node.next.next;
};

// 3=>4=>5=>null
// 4=>4=>5=>null
// 4=>5=>null

// 1=>2=>3=>4
// given 3=>4=null
// 1=>2=>4

// 1=>2=>3=>4

linkedList = new LinkedList();
linkedList.add(1);
linkedList.add(2);
linkedList.add(3);
linkedList.add(4);
console.log(linkedList.head.next);
console.log(deleteNode(linkedList.head.next.next)); // 1=>2=>4
console.log(linkedList.head.next);
