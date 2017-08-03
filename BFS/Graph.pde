import java.util.Map;


class Graph {
  
  // undirected graph
  
  ArrayList<Vertex> vertices;
  HashMap<String, Vertex> graph;
  
  Graph() {
    vertices = new ArrayList<Vertex>();
    graph = new HashMap<String, Vertex>();
  }
  
  void addNode(String data) {
    Vertex n = new Vertex(data);
    vertices.add(n);
    graph.put(n.data, n);
  }
  
  void makeConnection(String n1, String n2) {
    Vertex one = graph.get(n1);
    Vertex two = graph.get(n2);
    if (one == null || two == null) return;
    one.connect(two);
    two.connect(one);
  }
  
  void printGraph() {
    for (int i = 0; i < vertices.size(); i++) {
      Vertex n = vertices.get(i);
      for (int j = 0; j < n.edges.size(); j++) {
        println(n.data, " --> ", n.edges.get(j).data);
      }
    }
  }
  
  boolean findPath(String start, String target) {
    Queue q = new Queue();
    // set of all the seen nodes
    HashMap<String, Vertex> seen = new HashMap<String, Vertex>();
    // add start to the q
    q.enqueue(graph.get(start));
    
    while (!q.isEmpty()) {
      Vertex current = q.dequeue().data;
      seen.put(current.data, current);
      println("Current vertex: ", current.data);
      if (current.data == target) {
        return true;
      }
      for (int i = 0; i < current.edges.size(); i++) {
        Vertex v = current.edges.get(i);
        if (!seen.containsKey(v.data)) {
          q.enqueue(v);
          seen.put(v.data, v);
          println("Enqueue: ", v.data);
        }
      }
    }
    return false;
  }
}