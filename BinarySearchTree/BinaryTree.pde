class BinaryTree {
  Node root;
  
  void add(int data) {
    if (root == null) root = new Node(data);
    else root.add(data);
  }
  
  void printInorder() {
    if (root == null) {
      println("EMPTY");
    }
    else root.printInorder();
  }
  
  boolean contains(int d) {
    if (root == null) return false;
    return root.find(d);
  }
  
  void display() {
    root.display(1, 0, width);
  }
}