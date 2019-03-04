ArrayList<PVector> positions=new ArrayList<PVector>();
ArrayList<PVector> velocities=new ArrayList<PVector>();
int lines;

void setup() {
  //size(800, 800);
  fullScreen();
  background(255);
  colorMode(RGB);
  strokeWeight(1);
  stroke(0,50);
  lines = 5;
  for (int i=0; i<(lines*2); i++) {
    positions.add(new PVector(random(width), random(height)));
    PVector vel=PVector.random2D();
    vel.mult(random(3,5));
    velocities.add(vel);
  }
}

void draw() {
  for (int i=0; i<positions.size(); i+=2) {
    PVector pos1 = positions.get(i);
    PVector pos2 = positions.get(i+1);
    PVector vel1 = velocities.get(i);
    PVector vel2 = velocities.get(i+1);
    line(pos1.x,pos1.y,pos2.x,pos2.y);
    checkWalls(pos1, vel1);
    checkWalls(pos2, vel2);
    pos1.add(vel1);
    pos2.add(vel2);
  }
}

void checkWalls(PVector pos, PVector vel) {
  if (pos.x<=0 || pos.x>=width) {
    vel.x=vel.x*-1;
  } else if (pos.y<=0 || pos.y>=height) {
    vel.y=vel.y*-1;
  }
}
