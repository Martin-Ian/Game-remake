ArrayList<Entity> allEntities = new ArrayList<Entity>();
Player player;
float cameraX, cameraY;
boolean isUp, isDown, isRight, isLeft;

void setup()
{
  fullScreen(P3D);
  cameraX = width/2;
  cameraY = height/2;
  player = new Player();
  for (int i = 0; i < 50; i++)
  {
    allEntities.add(new Entity());
  }
  allEntities.add(new Wall(width/2, 0, width, 20));
  allEntities.add(new Wall(width/2, height, width, 20));
  allEntities.add(new Wall(0, height/2, 20, height));
  allEntities.add(new Wall(width, height/2, 20, height));
}

void draw()
{
  background(50);
  for(Entity E : allEntities)
    if(player.collides(E))
      background(255, 0, 0);
  player.move();
  updateEntities(player);
  cameraFollow(player);
  drawEntities(player);
  updateEntities(allEntities);
  drawEntities(allEntities);
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

void cameraFollow(Entity E)
{
  cameraX = lerp(cameraX, E.position.x, 0.05);
  cameraY = lerp(cameraY, E.position.y, 0.05);
  camera(cameraX, cameraY, (height/2) / tan(PI*30.0 / 180.0), cameraX, cameraY, 0, 0, 1, 0);
}

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