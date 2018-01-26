/********************************
 Ian Martin 2018
 BulletHell Remake
 
 Main.pde
 ********************************/

//Wall arrayList
ArrayList<Entity> walls = new ArrayList<Entity>();
//Player Entity
Player player;
//Enemy arrayList
ArrayList<Entity> enemies = new ArrayList<Entity>();
//Bullet arraylist
ArrayList<Entity> bullets = new ArrayList<Entity>();
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
  cameraX = width/4;
  cameraY = height/2;

  //Object declarations:
  player = new Player(width/4, height/2);
  for (int i = 0; i < 10; i++)
    enemies.add(new Enemy(width*3/4, height/2));
  walls.add(new Wall(width/2, 0, width + 20, 20));
  walls.add(new Wall(width/2, height, width + 20, 20));
  walls.add(new Wall(0, height/2, 20, height + 20));
  walls.add(new Wall(width, height/2, 20, height + 20));
  walls.add(new Wall(width/2, height/2, 20, height*2/3));
}

void draw()
{
  background(50);

  handleColision();

  updateEntities(enemies);
  drawEntities(enemies);

  updateEntities(player);
  cameraFollow(player);
  drawEntities(player);

  updateEntities(bullets);
  drawEntities(bullets);

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
    E.move();
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
  E.move();
  E.update();
}

//Function for the camera to follow a specific Entity

void cameraFollow(Entity E)
{
  cameraX = lerp(cameraX, E.position.x, 0.05);
  cameraY = lerp(cameraY, E.position.y, 0.05);
  camera(cameraX, cameraY, (height/2) / tan(PI*30.0 / 180.0), cameraX, cameraY, 0, 0, 1, 0);
}

void handleColision()
{
  for (Entity E : walls) //For each Wall
  {
    if (player.alive && player.collides(E))
    {
      player.velocity.mult(-1); //Player bounce off wall
      player.update();  //Apply velocity
    }
    for (Entity EN : enemies) //For each Enemy
    {
      if (EN.collides(E))
      {
        EN.velocity.mult(-2); //Enemy bounces off wall
        EN.update();  //apply velocity
      }
    }
    for (int i = bullets.size() - 1; i >= 0; i--)
    {
      if (bullets.get(i).collides(E))
      {
        bullets.remove(i);
        continue;
      } else if (player.alive && bullets.get(i).collides(player))
      {
        bullets.remove(i);
        player.lives--;
      }
    }
  }
  if (player.alive) {
    for (int i = enemies.size()-1; i >= 0; i--)
    {
      if (player.collides(enemies.get(i)))
      {
        enemies.remove(i);
      }
    }
  }

  if (player.lives <= 0)
  {
    player.alive = false;
  }
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

//Helper function...

float floatLimit(float A, float B)
{
  if (A > B)
    return A;
  else
    return B;
}
