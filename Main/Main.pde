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
Stage stage;

void setup()
{
  //fullScreen(P3D);
  size(1550, 850, P3D);
  //We need to use Processing's 3d renderer
  //in order to access the camera function

  //Initial camera position
  cameraX = width/4;
  cameraY = height/2;
  textAlign(CENTER);

  //Declare stage
  stage = new Stage();
}

void draw()
{
  if (stage.firstFrame)
    stage._setup();
  stage._draw();
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
  if (player.alive)
  {
    cameraX = lerp(cameraX, E.position.x, 0.05);
    cameraY = lerp(cameraY, E.position.y, 0.05);
  } else 
  {
    cameraX = lerp(cameraX, stage.Width/2, 0.05);
    cameraY = lerp(cameraY, stage.Height/2, 0.05);
  }
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
      if (E.special && bullets.get(i).collides(E))
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