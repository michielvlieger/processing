boolean[][][] grid;
HashMap<String, Integer> head = new HashMap<String, Integer>();
ArrayList<String> path;
int xcells, ycells, zcells, scl;
color background, cube;

void setup() {
  //size(800, 800, P3D);
  fullScreen(P3D);
  frameRate(5);
  scl=800;
  xcells=40;
  ycells=40;
  zcells=10;
  background=color(random(255),random(255),random(255));
  cube=color(random(255),random(255),random(255));
  grid= new boolean[xcells][ycells][zcells];
  path=new ArrayList<String>();
  generatePath();
}

void draw() {
  translate(-xcells/2*scl+width/2, -ycells/2*scl+height/2, (-zcells+2)*scl);
  background(background);
  fill(cube);
  stroke(255);
  for (int x=0; x<grid.length; x++) {
    for (int y=0; y<grid[x].length; y++) {
      for (int z=0; z<grid[x][y].length; z++) {
        if (grid[x][y][z]) {
          pushMatrix();
          translate((x)*(scl), (y)*(scl), z*(scl));
          //println(x*scl+" "+y*scl+" "+z*scl);
          box(scl);
          popMatrix();
        }
      }
    }
  }
  move();
}

void headToGrid() {
  grid[head.get("x")][head.get("y")][head.get("z")]=true;
}

void move() {
  //println(path.size()+" "+path.get(path.size()-1));
  if (path.size()!=0) {
    changeDir(path.get(path.size()-1));
    headToGrid();
    path.remove(path.size()-1);
  } else {
    generatePath();
    background=cube;
    cube=color(random(255),random(255),random(255));
  }
}

void generatePath() {
  grid= new boolean[xcells][ycells][zcells];
  head.put("x", xcells/2);
  head.put("y", ycells/2);
  head.put("z", zcells-1);
  path.add("forward");
  changeDir("backward");
  while (head.get("z")!=0) {
    float ran = random(1);
    if (ran<=0.20) {
      path.add("forward");
      changeDir("backward");
    } else if (ran>0.20&&ran<=0.40) {
      path.add("right");
      changeDir("left");
    } else if (ran>0.40&&ran<=0.60) {
      path.add("left");
      changeDir("right");
    } else if (ran>0.60&&ran<=0.80) {
      path.add("down");
      changeDir("up");
    } else if (ran>0.80&&ran<=1) {
      path.add("up");
      changeDir("down");
    }
  }
  println(path);
  headToGrid();
}

void changeDir(String dir) {
  switch(dir) {
  case "left": 
    head.put("x", head.get("x")-1);
    break;
  case "right": 
    head.put("x", head.get("x")+1);
    break;
  case "up":
    head.put("y", head.get("y")-1);
    break;
  case "down":
    head.put("y", head.get("y")+1);
    break;
  case "forward":
    head.put("z", head.get("z")+1);
    break;
  case "backward":
    head.put("z", head.get("z")-1);
    break;
  }
}
