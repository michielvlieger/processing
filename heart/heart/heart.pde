
ArrayList<PVector> heart = new ArrayList<PVector>();
float a = 0;
void setup() {
  //size(400, 400);
  fullScreen();
}


void draw() {
  background(0);
  translate(width/2, height/2);
  textSize(32);
  textAlign(CENTER);
  fill(150,0,100);
  text("Gefeliciteerd mama",0,-height/2+100);

  stroke(255);
  strokeWeight(2);
  beginShape();
  for (PVector v : heart) {
    float r = map(sin(a),-1,1,height/80,height/40);
    vertex(r*v.x, r*v.y);
  }
  endShape();
  if (a<TWO_PI) {
    float x =  16 * pow(sin(a), 3);
    float y = -(13 * cos(a) - 5 * cos(2 * a) - 2 * cos(3 * a)- cos(4 * a));
    heart.add(new PVector(x, y));
  } else {
    if (heart.size()==0) {
      a=0;
    } else {
      heart.remove(0);
    }
  }

  a += 0.05;
}
