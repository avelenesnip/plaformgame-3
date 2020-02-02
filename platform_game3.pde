import fisica.*;

color black = #000000;
color pink = color(255, 174, 201);
color red = color (255, 0, 0);
color blue = color(255, 0, 0);


PImage map;

int x = 0;
int y = 0;

final int gridSize = 109;



FBox player1, player2;
//FBomb bomb = null;
float vx, vy, zoom, angle;

boolean upkey, downkey, leftkey, rightkey, wkey, skey, akey, dkey, qkey, ekey, spacekey;

ArrayList <FBox> boxes = new ArrayList<FBox>();


FWorld world;

void setup() {

  fullScreen();


  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);


  map = loadImage("map.png");  

  while (y < map.height) {
    color c = map.get (x, y);

    if ( c == black) {
      FBox b = new FBox(gridSize, gridSize);
      b.setName("ground");
      b.setStrokeColor(black);
      b.setFillColor(black);
      b.setPosition(x*gridSize, y*gridSize);
      b.setFriction(1);
      b.setStaticBody(true);
      world.add(b);
    }

    if ( c == pink) {
      FBox p = new FBox(gridSize, gridSize);
      p.setName("ground");
      p.setStrokeColor(pink);
      p.setFillColor(pink);
      p.setPosition(x*gridSize, y*gridSize);
      p.setFriction(1);
      p.setStaticBody(true);
      world.add(p);
    }


    if ( c == black) {
      FBox b = new FBox(gridSize, gridSize);
      b.setName("ground");
      b.setStrokeColor(black);
      b.setFillColor(black);
      b.setPosition(x*gridSize, y*gridSize);
      b.setFriction(1);
      b.setStaticBody(true);
      world.add(b);
    }

    if ( c == blue) {
      FBox b = new FBox(gridSize, gridSize);
      b.setName("player1");
      b.setStrokeColor(blue);
      b.setFillColor(blue);
      b.setPosition(x*gridSize, y*gridSize);
      b.setFriction(1);
      b.setStaticBody(true);
      world.add(b);
    }

    if ( c == red) {
      FBox b = new FBox(gridSize, gridSize);
      b.setName("player2");
      b.setStrokeColor(red);
      b.setFillColor(red);
      b.setPosition(x*gridSize, y*gridSize);
      b.setFriction(1);
      b.setStaticBody(true);
      world.add(b);
    }



    x++;

    if ( x > map.width) {
      x = 0;
      y++;
    }
  }

  player1();

  player2();
}//////////////////////////////////////








void draw() {

  background(#E0FFFF);


  pushMatrix();

translate (-player1.getX() + width/2,-player1.getY() + height/2);
  world.step();  
  world.draw();

  popMatrix();


  vx = 0;
  vy = 0;

  if (leftkey) vx = -500;
  if (rightkey) vx = 500;
  player1.setVelocity (vx, player1.getVelocityY());

  if (akey) vy = -500;
  if (dkey) vy = 500;
  player2.setVelocity (vy, player2.getVelocityY());

  ArrayList<FContact> contacts1 = player1.getContacts();
  ArrayList<FContact> contacts2 = player2.getContacts();

  if (upkey && contacts1.size() > -0) player1.setVelocity (player1.getVelocityX(), 1900);
  if (wkey && contacts2.size() > -0) player2.setVelocity (player2.getVelocityX(), 1900);
}

void player1() {
  player1 = new FBox(20, 20);
  player1.setPosition(100, 100);

  //set visuals
  player1.setStroke(0);
  player1.setStrokeWeight(2);
  player1.setFillColor(pink);


  //set physical properties
  player1.setDensity(0.2);
  player1.setFriction(1);
  player1.setRestitution(0.25);
  world.add(player1);
}

void player2() {
  player2 = new FBox(20, 20);
  player2.setPosition(100, 20);

  //set visuals
  player2.setStroke(0);
  player2.setStrokeWeight(2);
  player2.setFillColor(blue);

  //set physical properties
  player2.setDensity(0.2);
  player2.setFriction(1);
  player2.setRestitution(0.25);
  world.add(player2);
}





void keyPressed() {
  if (key == 's' || key == 'S') skey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'q' || key == 'Q') qkey = true;
  if (key == 'e' || key == 'E') ekey = true;
  if (key == ' ') spacekey = true;

  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == UP) upkey = true;
}



void keyReleased() {

  if (key == 's' || key == 'S') skey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'q' || key == 'Q') qkey = false;
  if (key == 'e' || key == 'E') ekey = false;
  if (key == ' ') spacekey = false;

  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == UP) upkey = false;
}
