class Vertex {
  String data;
  HashMap<String, Vertex> edges;
  boolean searched;
  Vertex parent;
  
  
  Vertex(String d) {
    data = d;
    edges = new HashMap<String, Vertex>();
    searched = false;
    parent = null;
  }
  
  void connect(Vertex other) {
    edges.put(other.data, other);
  }
}