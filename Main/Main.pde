/********************************
 Ian Martin 2018
 BulletHell Remake
 ********************************/

//test array
ArrayList<Entity> walls = new ArrayList<Entity>();
//Player Entity
Player player;
//Camera controls
float cameraX, cameraY;
//Player Controls
boolean isUp, isDown, isRight, isLeft;

void setup()
{
  fullScreen(P3D);
  //We need to use Processing's 3d renderer
  //in order to access the camera function

  //Initial camera position
  cameraX = width/2;
  cameraY = height/2;

  //Object declarations:
  player = new Player();
  walls.add(new Wall(width/2, 0, width + 20, 20));
  walls.add(new Wall(width/2, height, width + 20, 20));
  walls.add(new Wall(0, height/2, 20, height + 20));
  walls.add(new Wall(width, height/2, 20, height + 20));
}

void draw()
{
  background(50);
  for (Entity E : walls)
    if (player.collides(E))
    {
      player.velocity.mult(-1);
      player.update();
    }
  player.move();
  updateEntities(player);
  cameraFollow(player);
  drawEntities(player);
  updateEntities(walls);
  drawEntities(walls);
}

void drawEntities(ArrayList<Entity> arr)
{
  rectMode(CENTER);
  noStroke();
  for (Entity E : arr)
  {
    E.show();
  }
}

void updateEntities(ArrayList<Entity> arr)
{
  for (Entity E : arr)
  {
    E.update();
  }
}

//Same as above, but for single entities

void drawEntities(Entity E)
{
  rectMode(CENTER);
  noStroke();
  E.show();
}

void updateEntities(Entity E)
{
  E.update();
}

//Function for the camera to follow a specific Entity

void cameraFollow(Entity E)
{
  cameraX = lerp(cameraX, E.position.x, 0.05);
  cameraY = lerp(cameraY, E.position.y, 0.05);
  camera(cameraX, cameraY, (height/2) / tan(PI*30.0 / 180.0), cameraX, cameraY, 0, 0, 1, 0);
}

//Keyboard input

void keyPressed() 
{
  setMove(keyCode, true);
}

void keyReleased() 
{
  setMove(keyCode, false);
}

boolean setMove(int k, boolean b) 
{
  switch (k) {
  case UP:
  case 'W':
    return isUp = b;

  case LEFT:
  case 'A':
    return isLeft = b;

  case RIGHT:
  case 'D':
    return isRight = b;

  case DOWN:
  case 'S':
    return isDown = b;

  default:
    return b;
  }
}