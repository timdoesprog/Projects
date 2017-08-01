class Node {
  Node left;
  Node right;
  int data;
  int levelHeight = 50;
  int nodeRadius = 24;
  
  Node(int d) {
    data = d;
  }
  
  void add(int d) {
    // dont allow duplicates in the tree
    if (data == d) return;
    
    if (d < data && left != null) left.add(d);
      
    else if (d > data && right != null) right.add(d);
      
    else if (d < data && left == null) left = new Node(d);

    else right = new Node(d);
  }
  
  void printInorder() {
    if (left != null) {
      left.printInorder();
    }
    println(data);
    if (right != null) {
      right.printInorder();
    }
  }
  
  boolean find(int d) {
    if (data == d) return true;
    if (d < data && left != null) return left.find(d);
    else if (d > data && right != null) return right.find(d);
    return false;
  }
  
  void display(int level, float low, float high) {
    stroke(255);
    fill(255);
    float mid = (low + high) / 2;
    ellipse(mid, level * levelHeight, nodeRadius*2, nodeRadius*2);    
    
    // left node + line towards it
    if (left != null) {
      line(mid, level * levelHeight, (low + mid) / 2, (level + 1) * levelHeight);
      left.display(level + 1, low, mid);
    }
    // right node + line towards it
    if (right != null) {
      right.display(level + 1, mid, high);
      line(mid, level * levelHeight, (mid + high) / 2, (level + 1) * levelHeight);
    }
    
    // draw numbers in the nodes
    textSize(nodeRadius/1.5);
    fill(51);
    text(data, mid - 10, level * levelHeight + 5);
  }
}