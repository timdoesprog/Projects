class Field {
  PVector[][] vectors;
  // how big are the cells
  int resolution;
  
  Field(int r) {
    resolution = r;
    vectors = new PVector[width/resolution][height/resolution];
    init();
  }
  
  PVector lookUp(float x, float y) {
    return vectors[int(x/resolution)][int(y/resolution)];
  }
  
  void init() {
    // reseed noise function to get different feels every time
    noiseSeed((int)random(10000));
    float xOff = 0;
    for (int x = 0; x < width/resolution; x++) {
      float yOff = 0;
      for (int y = 0; y < height/resolution; y++) {
        // vector from random angle
        float angle = map(noise(xOff, yOff), 0, 1, 0, TWO_PI);
        vectors[x][y] = PVector.fromAngle(angle).setMag(5);
        yOff += 0.1;
      }
      xOff += 0.1;
    }
  }
}