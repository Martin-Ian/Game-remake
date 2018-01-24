class Player extends Entity
{
  Player()
  {
    super();
    filler = color(0, 255, 0);
    velocity.setMag(0);
  }
  
  Player(float posX, float posY)
  {
    super(posX, posY);
    filler = color(0, 255, 0);
    velocity.setMag(0);
  }
  
  void move()
  {
    if(isRight)
    {
      velocity.x = lerp(velocity.x, 5, 0.1); 
    }
    else if(isLeft)
    {
      velocity.x = lerp(velocity.x, -5, 0.1); 
    } 
    else 
    {
      velocity.x = lerp(velocity.x, 0, 0.1); 
    }
    
    if(isDown)
    {
      velocity.y = lerp(velocity.y, 5, 0.1); 
    }
    else if(isUp)
    {
      velocity.y = lerp(velocity.y, -5, 0.1); 
    } 
    else 
    {
      velocity.y = lerp(velocity.y, 0, 0.1); 
    }
  }
}