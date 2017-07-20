Bird flap;
ArrayList<Obstacle> obstacles;
int gameOverSize = 32;
int points = 0;

void setup() {
  size(900, 600);
  flap = new Bird();
  obstacles = new ArrayList<Obstacle>();
  obstacles.add(new Obstacle());
}

void draw() {
  background(30,2,63);
  
  if (flap.alive) {
    // display score
    textSize(24);
    fill(255);
    text(points, 30, 30);
    if (frameCount % 140 == 0) {
      obstacles.add(new Obstacle());
    }
    flap.display();
    flap.update();
    flap.checkForObstacles();
    for (Obstacle o : obstacles) {
      o.display();
      o.update();
    }
    // obstacles cleanup
    for (int i = obstacles.size() - 1; i >= 0; i--) {
      Obstacle o = obstacles.get(i);
      if (o.x <= -50) {
        obstacles.remove(i);
        points++;
      }
    }
  }
  else {
    obstacles = new ArrayList<Obstacle>();
    
    // gameOver
    textSize(gameOverSize);
    fill(255);
    text("GAME OVER", width/2 - gameOverSize*2.8, height /2); 
    if (gameOverSize <= 80) {
      gameOverSize += 1;
    }
    
    // display final score
    textSize(32);
    fill(255);
    text(points, width/2, height - 80);
  
    // display play again message
    textSize(16);
    fill(255);
    text("Click to play again", width/2 - 60, height - 40);
  }
}

void keyPressed() {
  if (flap.alive && key == ' ') {
    flap.swing();
  }
}

void mousePressed() {
  if (!flap.alive) {
    flap.alive = true;
    flap.location.y = height/2;
    points = 0;
    gameOverSize = 32;
  }
}