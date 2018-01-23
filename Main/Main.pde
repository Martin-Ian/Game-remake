ArrayList<Entity> allSprites = new ArrayList<Entity>();

void setup()
{
  fullScreen();
  for (int i = 0; i < 500; i++)
  {
    allSprites.add(new Entity());
  }
}

void draw()
{
  background(50);
  updateSprites(allSprites);
  drawSprites(allSprites);
}

void drawSprites(ArrayList<Entity> arr)
{
  rectMode(CENTER);
  noStroke();
  for (Entity E : arr)
  {
    E.show();
  }
}

void updateSprites(ArrayList<Entity> arr)
{
  for (Entity E : arr)
  {
    E.update();
  }
}