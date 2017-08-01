void setup() {
  size(1200, 600);
  background(51);
  BinaryTree tree = new BinaryTree();
  for (int i = 0; i < 15; i++) {
    tree.add(int(random(20)));
  }
  // tree.printInorder();
  // println(tree.contains(15));
  tree.display();
}

void draw() {
  
}

void mousePressed() {
  background(51);
  BinaryTree tree = new BinaryTree();
  for (int i = 0; i < 15; i++) {
    tree.add(int(random(20)));
  }
  tree.display();
}