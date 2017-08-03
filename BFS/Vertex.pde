class Vertex {
  String data;
  ArrayList<Vertex> edges;
  boolean searched;
  Vertex parent;
  
  
  Vertex(String d) {
    data = d;
    edges = new ArrayList<Vertex>();
    searched = false;
    parent = null;
  }
  
  void connect(Vertex other) {
    edges.add(other);
  }
}