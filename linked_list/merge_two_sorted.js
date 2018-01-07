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

// recursive approach
// T: O(N)

// we start with the head of l1, and the head of l2
// one of which is guaranteed to be the smallest value overall
// check to see which one is smaller, and set it to min
// after that, compare the next relevant values

// we need to set headMin's next to the result of subsequent recursion

// what's our base case?
// when we're on the last node of each

var mergeTwoLists = function(h1, h2) {
  if (!h1 && !h2) return null;

  var currMin;
  if ((h1 && h2 && h1.val <= h2.val) || (!h2)) {
    currMin = h1;
    h1 = h1.next;
  } else if ((h1 && h2 && h2.val <= h1.val) || (!h1)) {
    currMin = h2;
    h2 = h2.next;
  }

  if (h1 || h2)
    currMin.next = mergeTwoLists(h1, h2);

  return currMin;
};

// more semantic

function mergeTwoLists(head1, head2) {
  if (!head1 && !head2) return null;
  if ( head1 && !head2) return head1;
  if (!head1 &&  head2) return head2;

  if (head1.val <= head2.val) {
    return append(head1, mergeTwoLists(head1.next, head2))
  } else {
    return append(head2, mergeTwoLists(head1, head2.next));
  }
}

function append(head, tail) {
  head.next = tail;
  return head;
}

linkedList1 = new LinkedList();
linkedList1.add(5);
linkedList1.add(10);
linkedList1.add(15);
linkedList2 = new LinkedList();
linkedList2.add(2);
linkedList2.add(3);
linkedList2.add(20);
console.log(mergeTwoLists(linkedList1.head, linkedList2.head)); // 2=>3=>5=>10>15>20
