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

// T: O(N), S: O(1)

// 1=>2=>3=>4=>5=>6
// 1<=2<=3<=4<=5<=6
// return 6

// 1<=2, lost reference to 3

// prev, current, next
// null    1       2
// current points to prev

// prev, current, next
// 1       2       3

// prev, current, next
// 1       2       3

// null<=1    2=>3=>4=>5=>6

// null<=1<=2    3=>4=>5=>6

// null<=1<=2<=3    4=>5=>6

// null<=1<=2<=3<=4    5=>6

// null<=1<=2<=3<=4<=5    6

// null<=1<=2<=3<=4<=5<=6

// 6=>5=>4=>3=>2=>1

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

function reverseList(head) {
  if (!head)      return null;
  if (!head.next) return head;

  tailHead = reverseList(head.next);
  head.next.next = head;
  head.next = null;
  return tailHead;
}

// var linkedList = new LinkedList();
// linkedList.add(4);
// linkedList.add(5);
// linkedList.add(6);
// reverseList(linkedList.head); // [6,5]

// [1,2,3,4,5,6,null]

// [5,6,null]
// reverseList(6) => 6

// reverseList(5)
// tailHead = 6
// [5,6,null] => [5,6,5]
//               [5,null,5]
//                  [6,5,null]
//     5=>6=>null, 5<=>6, 6=>5=>null
// BEFORE we set next to null, 5 <=> 6 hence the Circularity
// return 6

// reverseList(4)
// tailHead = 6=>5=>null
// 4=>5=>null, 4<=>5, 6=>5=>4=>null

// var linkedList = new LinkedList();
// linkedList.add(1);
// linkedList.add(2);
// linkedList.add(3);
// linkedList.add(4);
// linkedList.add(5);
// linkedList.add(6);
// console.log(reverseList(linkedList.head)); // [6,5,4,3,2,1]

// linkedList = new LinkedList();
// linkedList.add(1);
// linkedList.add(2);
// console.log(reverseList(linkedList.head)); // [2,1]
