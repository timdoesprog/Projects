PImage img;


void setup() {
  size(788, 800);
  img = loadImage("rain.jpg");
}

void draw() {
  // image(img, 0, 0);
  loadPixels();
  img.loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      // flashlight effect with distance
      float d = dist(x, y, mouseX, mouseY);
      float r = red(img.pixels[index]);
      float g = green(img.pixels[index]);
      float b = blue(img.pixels[index]);
      pixels[index] = color(r-d, g-d, b-d);
    }
  }
  updatePixels();
}