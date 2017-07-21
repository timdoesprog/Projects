int size = 20;
int rows = 40;
int cols = 40;
int[][] cells = new int[rows][cols];
Player player;
PVector food;


void setup() {
  size(800, 800);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      cells[i][j] = 0;
    }
  }
  player = new Player();
  food = new PVector(int(random(rows)), int(random(cols)));
}


void draw() {
  background(51);
  stroke(255);
  for (int x = 0; x < width; x += size) {
    for (int y = 0; y < height; y += size) {
      line(x, y, x, y+size);
      line(x, y, x+size, y);
    }
  }
  if (frameCount % 10 == 0) {
    player.update();
  }
  player.display();
  // display food
  fill(255);
  ellipse(food.x * size + size/2, food.y * size + size/2, 8, 8);
  if (food.x == player.x && food.y == player.y) {
    food = new PVector(int(random(rows)), int(random(cols)));
    player.tailLength++;
    player.increase();
  }
}

void keyPressed() {
  if (keyCode == UP) {
    player.xSpeed = 0;
    player.ySpeed = -1;
  }
  if (keyCode == DOWN) {
    player.xSpeed = 0;
    player.ySpeed = 1;
  }
  if (keyCode == RIGHT) {
    player.xSpeed = 1;
    player.ySpeed = 0;
  }
  if (keyCode == LEFT) {
    player.xSpeed = -1;
    player.ySpeed = 0;
  }
}