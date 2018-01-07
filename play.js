// Given a list, rotate the list to the right by k places, where k is non-negative.

// 1=>2=>3=>4=>5=>6=>null
// k=0,6
// anchor = 4
// anchor.next = 5, newHead
// runner = 6, => originalHead
// runner.next = null

// 5=>6=>1=>2=>3=>4=>null

// 1=>2=>3=>4=>null
// 5=>6=>

// 6=>1=>2=>3=>4=>5
// k=1,7

// 5=>6=>1=>2=>3=>4
// k=2,8

// 4=>5=>6=>1=>2=>3
// k=3,9

// 3=>4=>5=>6=>1=>2
// k=4,10

// 2=>3=>4=>5=>6=>1
// k=5,11

// k % length / # of nodes in LL
// 6%6=0
// 7%6=1

// sub-problem
// how do you find k nodes from the end of the list?
//   anchor initialized at first node
//   runner initialized at (first node + k) node

//   increment both anchor and runner by 1
//   stop when runner.next is null (or runner is last node)
//   *now my anchor.next is at k from the end of the list
      // (and anchor is the new last node)

// rotation
//   runner.next = original head
//   anchor.next = null

// return new head (anchor.next/ k from end)

// 1=>2=>3=>4=>5=>6=>null

// 1=>2=>3=>4=>5=>6=>null
// k=0
// anchor = 4
// anchor.next = 5, newHead
// runner = 6, => originalHead
// runner.next = null

function getLength(head) {
  var count = 0;
  var current = head;

  while (current) {
    count++;
    current = current.next;
  }

  return count;
}

function rotateRight(head, k) {
  if (!head) return null;

  var anchor = head;
  var runner = head;
  var length = getLength(head);

  k = k % length;

  if (!k) return head;

  for (var i = 0; i < k; i++) {
    runner = runner.next;
  }

  while (runner.next) {
    anchor = anchor.next;
    runner = runner.next;
  }

  var newHead = anchor.next;
  runner.next = head;
  anchor.next = null;

  return newHead;
}
