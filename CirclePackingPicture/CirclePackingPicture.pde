class Circle {
  PVector location;
  float radius;
  boolean growing = true;
  color c;

  Circle(float x, float y, color c_) {
    location = new PVector(x, y);
    radius = 0;
    c = c_;
  }

  void grow() {
    if (growing) {
      radius++;
    }
  }

  boolean hit() {
    return (location.x + radius > width || location.x - radius < 0 ||
       location.y + radius > height || location.y - radius < 0);
  }

  void display() {
    stroke(c);
    strokeWeight(2);
    fill(c);
    ellipse(location.x, location.y, radius * 2, radius * 2);
  }
}


ArrayList<Circle> circles;
boolean finished = false;
PImage img;
int maxCircles = 30000;


void setup() {
  size(1500, 844);
  img = loadImage("horizon.jpg");
  img.loadPixels();
  circles = new ArrayList<Circle>();
  // circles.add(new Circle(random(width), random(height)));
}

void draw() {
  if (!finished && maxCircles > 0) {
    background(51);
    int validCircles = 0;
    for (int i = 0; i < 1000; i++) {
      if (validCircles < 1000) {
        if (createCircle()) {
        validCircles++;
        maxCircles--;
        }
      }
    }
    if (validCircles == 100) {
      finished = true;
    }
    for (Circle c : circles) {
      if (c.growing) {
        if (c.hit()) {
          c.growing = false;
        }
        for (Circle c2 : circles) {
          if (c2 != c) {
            PVector distance = PVector.sub(c.location, c2.location);
            if (distance.mag() - 2 < c.radius + c2.radius) {
              c.growing = false;
              c2.growing = false;
              break;
            }
          }
        }
      }
      c.display();
      c.grow();
    }
  }
  else {
    save("horizonCircles.jpg");
    println("Finished");
    noLoop();
  }
}

boolean createCircle() {
  int x = int(random(width));
  int y = int(random(height));

  for (Circle c : circles) {
    PVector distance = PVector.sub(new PVector(x, y), c.location);
    if (distance.mag() < c.radius) {
      return false;
    }
  }
  int index = x + y * width;
  float r = red(img.pixels[index]);
  float g = green(img.pixels[index]);
  float b = blue(img.pixels[index]);
  circles.add(new Circle(x, y, color(r, g, b)));
  return true;
}