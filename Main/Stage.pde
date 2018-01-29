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
    } else if(enemies.size() == 0)
    {
      winScreen();
    }
  }
}

void deathScreen()
{
  pushMatrix();
  textSize(32);
  fill(255);
  text("You Died!\nPress the 'SPACE-BAR' to restart!", cameraX, cameraY);
  popMatrix();
  if (space)
  {
    stageReset();
  }
}

void winScreen()
{
  pushMatrix();
  textSize(30);
  fill(255);
  text("You WON!\nPress the 'SPACE-BAR' to restart!\nEND OF SAMPLE STAGE", cameraX, cameraY);
  popMatrix();
  if (space)
  {
    //stage.level++;
    stageReset();
  }
}

void loadWalls(int levels)
{
  switch(levels)
  {
  case 0:
    stage.Width = 1600;
    stage.Height = 900;
    player = new Player(stage.Width/4, stage.Height/2);
    for (int i = 0; i < 10; i++)
      enemies.add(new Enemy(stage.Width*3/4, stage.Height/2));
    walls.add(new Wall(stage.Width/2, 0, stage.Width + 20, 20, false));
    walls.add(new Wall(stage.Width/2, stage.Height, stage.Width + 20, 20, false));
    walls.add(new Wall(0, stage.Height/2, 20, stage.Height + 20, false));
    walls.add(new Wall(stage.Width, stage.Height/2, 20, stage.Height + 20, false));
    walls.add(new Wall(stage.Width/2, stage.Height/2, 20, stage.Height*2/3, false));
    break;
  case 1:
    break;
  }
}

void stageReset()
{
  for (int i = walls.size() - 1; i >= 0; i--)
  { 
    walls.remove(i);
  }
  for (int i = enemies.size() - 1; i >= 0; i--)
  { 
    enemies.remove(i);
  }
  for (int i = bullets.size() - 1; i >= 0; i--)
  { 
    bullets.remove(i);
  }
  player = null;
  stage.firstFrame = true;
}