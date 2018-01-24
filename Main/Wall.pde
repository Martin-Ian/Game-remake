/*************************************
 Wall.pde
 
 This class is the wall class. Walls (as of now)
 cannot be moved through by anything. Will add
 special walls that Enemies can shoot through
 *************************************/

class Wall extends Entity //This class is a child of Entity
{
  //Default constructor
  Wall()
  {
    super();
    moveable = false;
    filler = color(0);
    collider = "RECTANGLE";
  }

  //Constructor with position; wall will be a 50x50 square
  Wall(float posX, float posY)
  {
    super(posX, posY);
    moveable = false;
    filler = color(0);
    collider = "RECTANGLE";
  }

  //Constructor with position and dimentions
  Wall(float posX, float posY, float dimX, float dimY)
  {
    super(posX, posY, dimX, dimY);
    moveable = false;
    filler = color(0);
    collider = "RECTANGLE";
  }
}