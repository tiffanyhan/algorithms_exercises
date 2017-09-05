var MyQueue = function() {

};

MyQueue.createNew = function() {
  console.log(this)
  this.stack1 = [];
  this.stack2 = [];
};

/**
 * Push element x to the back of queue.
 * @param {number} x
 * @return {void}
 */
MyQueue.prototype.push = function(x) {
  this.stack1.push(x);
};

/**
 * Removes the element from in front of queue and returns that element.
 * @return {number}
 */

MyQueue.prototype.turnOver = function() {
  while (this.stack1.length > 0) {
    this.stack2.push(this.stack1.pop());
  }
};

MyQueue.prototype.pop = function() {
  if (this.stack2.length === 0) this.turnOver();
  return this.stack2.pop();
};

/**
 * Get the front element.
 * @return {number}
 */
MyQueue.prototype.peek = function() {
  if (this.stack2.length === 0) this.turnOver();
  return this.stack2[this.stack2.length - 1];
};

/**
 * Returns whether the queue is empty.
 * @return {boolean}
 */
MyQueue.prototype.empty = function() {
  return this.stack1.length === 0 && this.stack2.length == 0;
};

 var obj = Object.create(MyQueue).createNew()
 obj.push(1)
 obj.push(2)
 obj.push(3)
 obj.push(4)
 obj.push(5)

 var param_2 = obj.pop()
 console.log(param_2)
 var param_3 = obj.peek()
 console.log(param_3)
 var param_4 = obj.empty()
 console.log(param_4)
