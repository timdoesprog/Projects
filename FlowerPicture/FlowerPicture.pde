PImage img;
int len = 5;
// Picture meassures 322 x 380
// size() doesn't accept variables
// int w = 322 * len;
// int h = 380 * len;
// higher values will make the picture more pixelated
int factor = 4;


void setup() {
  size(1610, 1900);
  img = loadImage("flowers.jpg");
  
  img.loadPixels();
  for (int x = 0; x < img.width; x += factor) {
    for (int y = 0; y < img.height; y += factor) {
      int index = x + y * img.width;
      color c = img.pixels[index];
      noStroke();
      fill(c);
      rect(x*len, y*len, factor*len, factor*len);
    }
  }
}