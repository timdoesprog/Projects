void setup() {
  size(400, 400);
  Graph graph = new Graph();
  graph.addNode("Tim");
  graph.addNode("Vale");
  graph.addNode("Samuel");
  graph.addNode("Isabelle");
  graph.addNode("Maxi");
  graph.makeConnection("Tim", "Vale");
  graph.makeConnection("Tim", "Samuel");
  graph.makeConnection("Tim", "Maxi");
  graph.makeConnection("Vale", "Samuel");
  graph.makeConnection("Vale", "Isabelle");
  graph.makeConnection("Samuel", "Isabelle");
  graph.makeConnection("Maxi", "Samuel");
  // graph.printGraph();
  println(graph.findPath("Tim", "Isabelle"));
}