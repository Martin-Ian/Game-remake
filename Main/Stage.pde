/*****************************
 Basic Stage class
 *****************************/

class Stage
{
  int level;
  boolean firstFrame = true;
  int Width, Height;
  Stage()
  {
    level = 0;
    Width = width;
    Height = height;
  }

  Stage(int stagenum)
  {
    level = stagenum;
  }

  void _setup()
  {
    loadWalls(level);
    firstFrame = false;
  }

  void _draw()
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

    drawEntities(walls);

    if (player.alive == false)
    {
      deathScreen();
    }
  }
}

void deathScreen()
{
  textSize(32);
  stroke(255);
  text("You Died!\nPress the 'SPACE-BAR' to continue!", width/2, height/2);
}

void loadWalls(int levels)
{
  switch(levels)
  {
  case 0:
    player = new Player(width/4, height/2);
    for (int i = 0; i < 10; i++)
      enemies.add(new Enemy(width*3/4, height/2));
    walls.add(new Wall(width/2, 0, width + 20, 20, false));
    walls.add(new Wall(width/2, height, width + 20, 20, false));
    walls.add(new Wall(0, height/2, 20, height + 20, false));
    walls.add(new Wall(width, height/2, 20, height + 20, false));
    walls.add(new Wall(width/2, height/2, 20, height*2/3, true));
    break;
  case 1:
    break;
  }
}