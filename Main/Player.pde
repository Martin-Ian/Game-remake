/*******************************
 Player.pde
 
 This class is the player class
 *******************************/

class Player extends Entity //This is based off of the Entity class
{
  //Default constructor
  Player()
  {
    super();
    filler = color(0, 255, 0);
    velocity.setMag(0);
  }

  //Constructor with position
  Player(float posX, float posY)
  {
    super(posX, posY);
    filler = color(0, 255, 0);
    velocity.setMag(0);
  }

  //This functions governs the movement of the player
  void move()
  {
    if (isRight)
    {
      velocity.x = lerp(velocity.x, 5, 0.1);
    } else if (isLeft)
    {
      velocity.x = lerp(velocity.x, -5, 0.1);
    } else 
    {
      velocity.x = lerp(velocity.x, 0, 0.1);
    }

    if (isDown)
    {
      velocity.y = lerp(velocity.y, 5, 0.1);
    } else if (isUp)
    {
      velocity.y = lerp(velocity.y, -5, 0.1);
    } else 
    {
      velocity.y = lerp(velocity.y, 0, 0.1);
    }
  }
}