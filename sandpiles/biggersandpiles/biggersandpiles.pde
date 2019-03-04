int[][] grains;
color[][] colors;
int rows, cols;

void setup() {
  size(800, 800);
  frameRate(5);
  noStroke();
  rows=40;
  cols=40;
  grains = new int[rows][cols];
  colors = new color[rows][cols];
  grains[20][20]=40000;
}

void updateColors() {
  for (int x=0; x<rows; x++) {
    for (int y=0; y<cols; y++) {
      int pile = grains[x][y];
      color col = color(219, 51, 64);
      switch(pile) {
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
      colors[x][y]=col;
    }
  }
}

void updateGrains() {
  int[][] nextpiles = new int[width][height];
  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < cols; y++) {
      int num = grains[x][y];
      if (num < 4) {
        nextpiles[x][y] = grains[x][y];
      }
    }
  }
  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < cols; y++) {
      int num = grains[x][y];
      if (num >= 4) {
        nextpiles[x][y] += (num - 4);
        if (x+1 < rows)
          nextpiles[x+1][y]++;
        if (x-1 >= 0)
          nextpiles[x-1][y]++;
        if (y+1 < cols) 
          nextpiles[x][y+1]++;
        if (y-1 >= 0) 
          nextpiles[x][y-1]++;
      }
    }
  }
  grains = nextpiles;
}

void show() {
  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < cols; y++) {
      color colour = colors[x][y];
      fill(colour);
      rect(width/rows*x, height/cols*y, width/rows, height/cols);
    }
  }
}

void draw() {
  updateColors();
  show();
  for (int i=0; i<1; i++) {
    updateGrains();
  }
}
