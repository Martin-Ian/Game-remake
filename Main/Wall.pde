class Wall extends Entity
{
  Wall()
  {
    super();
    moveable = false;
    filler = color(0);
    collider = "RECTANGLE";
  }

  Wall(float posX, float posY)
  {
    super(posX, posY);
    moveable = false;
    filler = color(0);
    collider = "RECTANGLE";
  }
  
  Wall(float posX, float posY, float dimX, float dimY)
  {
    super(posX, posY, dimX, dimY);
    moveable = false;
    filler = color(0);
    collider = "RECTANGLE";
  }
}