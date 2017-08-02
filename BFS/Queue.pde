class Queue {
  Node front;
  Node back;
  
  Queue() {
    front = null;
    back = null;
  }
  
  void enqueue(Vertex v) {
    Node n = new Node(v);
    if (front == null && back == null) {
      front = n;
      back = n;
    }
    else {
      back.next = n;
      back = n;
    }
  }
  
  Node dequeue() {
    if (front != null) {
      Node n = front;
      front = front.next;
      return n;
    }
    else return null;
  }
  
  boolean isEmpty() {
    return front == null;
  }
}