int[][] sandpiles;

void setup() {
  size(800, 800);
  sandpiles = new int[width][height];
  sandpiles[width/2][height/2]=400000;
}

void render() {
  loadPixels();
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      int grains = sandpiles[x][y];
      color col = color(219, 51, 64);
      switch(grains) {
      case 0:
        col = color(247, 234, 200);
        break;
      case 1:
        col = color(232, 184, 26);
        break;
      case 2:
        col = color(32,218,155);
        break;
      case 3:
        col = color(40,171,227);
        break;
      }
      pixels[x+y*width]=col;
    }
  }
  updatePixels();
}

void updateGrains() {
  int[][] nextpiles = new int[width][height];
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int num = sandpiles[x][y];
      if (num < 4) {
        nextpiles[x][y] = sandpiles[x][y];
      }
    }
  }
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int num = sandpiles[x][y];
      if (num >= 4) {
        nextpiles[x][y] += (num - 4);
        if (x+1 < width)
          nextpiles[x+1][y]++;
        if (x-1 >= 0)
          nextpiles[x-1][y]++;
        if (y+1 < height) 
          nextpiles[x][y+1]++;
        if (y-1 >= 0) 
          nextpiles[x][y-1]++;
      }
    }
  }
  sandpiles = nextpiles;
}



void draw() {
  render();
  for (int i=0; i<1; i++) {
    updateGrains();
  }
}
