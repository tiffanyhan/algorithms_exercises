// Given a linked list, determine if it has a cycle in it.

// when a pointer reaches null, then there's no cycle
// otherwise, both pointers will enter into the loop
// so both pointers will eventually converge
// when they converge, return true

function hasCycle(head) {
  if (!head || !head.next) return false;

  var slow = head;
  var fast = head.next;

  while (fast && fast.next) {
    if (slow === fast) return true;

    slow = slow.next;
    fast = fast.next.next;
  }

  return false;
}
