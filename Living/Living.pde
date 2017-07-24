Organism[] beings;
PVector[] food;


void setup() {
  size(1200, 900);
  beings = new Organism[10];
  for (int i = 0; i < beings.length; i++) {
    beings[i] = new Organism(random(width), random(height));
  }
  food = new PVector[20];
  for (int i = 0; i < food.length; i++) {
    food[i] = new PVector(random(width), random(height));
  }
}

void draw() {
  background(51);
  for (int i = 0; i < beings.length; i++) {
    // find closest food item
    int index = 0;
    float distance = PVector.dist(food[0], beings[i].location);
    for (int j = 1; j < food.length; j++) {
      float distance2 = PVector.dist(food[j], beings[i].location);
      if (distance2 < distance) {
        index = j;
      }
    }
    beings[i].arrive(food[index]);
    beings[i].update();
    beings[i].display();
  }
  
  // check for near organism to devour the food
  for (int i = 0; i < food.length; i++) {
    for (Organism o : beings) {
      if (PVector.dist(food[i], o.location) <= 5) {
        food[i] = new PVector(random(width), random(height));
        o.life += 15;
      }
    }
  }
  
  // display food
  for (int i = 0; i < food.length; i++) {
    noStroke();
    fill(255);
    ellipse(food[i].x, food[i].y, 4, 4);
  }
}