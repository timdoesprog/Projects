class Player {
  int x;
  int y;
  int xSpeed;
  int ySpeed;
  int tailLength;
  ArrayList<Snakepart> tail = new ArrayList<Snakepart>();
  
  Player() {
    x = width/2 / size;
    y = height/2 / size;
    tail.add(new Snakepart(x, y));
    cells[x][y] = 1;
    tailLength = 1;
    xSpeed = 1;
    ySpeed = 0;
  }
  
  void display() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (cells[i][j] == 1) {
          fill(255);
          rect(i * size, j * size, size, size);
        }
      }
    }
    for (Snakepart s : tail) {
      fill(255);
      rect(s.x, s.y, size, size);
    }
  }
  
  void update() {
    cells[x][y] = 0;
    x += xSpeed;
    y += ySpeed;
    if (x >= rows) {
      x = 0;
    }
    else if (x < 0) {
      x = rows-1;
    }
    if (y >= cols) {
      y = 0;
    }
    else if (y < 0) {
      y = cols-1;
    }
    cells[x][y] = 1;
  }
  
  void increase() {
    Snakepart s = tail.get(tail.size()-1);
    tail.add(new Snakepart(s.x - xSpeed, s.y - ySpeed));
  }
}