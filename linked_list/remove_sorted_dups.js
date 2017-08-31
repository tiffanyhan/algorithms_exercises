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

// var linkedList = new LinkedList();
// linkedList.add(1);
// linkedList.add(2);

// console.log(deleteDuplicates(linkedList)); // [1,2]

// linkedList = new LinkedList();
// linkedList.add(1);
// linkedList.add(1);
// linkedList.add(2);
// linkedList.add(3);
// linkedList.add(3);
// console.log(deleteDuplicates(linkedList)); // [1,2,3,4,5]
