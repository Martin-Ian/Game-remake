/************************************
 Enemy.pde
 
 This class is the basic enemy class
 ************************************/

class Enemy extends Entity //Child of Entity
{
  float speed = 3; //Max speed of entity
  float sight = 1000;  //What is the enimies "range"
  float ang1 = 0, ang2 = 0, angtemp = 0;  //This is for the "scope-effect"
  boolean inSight = false;  //Toggles on if the player is near
  int cooldown = 0, maxCoolDown = 60;  //For shooting

  //Constructors
  Enemy()
  {
    super(); 
    filler = color(255, 0, 0);
    type = "Enemy";
  }

  Enemy(float posX, float posY)
  {
    super(posX, posY); 
    filler = color(255, 0, 0);
    type = "Enemy";
  }

  //This says how the Enemy moves... and how it updates too... 
  //TODO: Add Shooting an move updates to separate update function
  void move()
  {
    //see if the player is close
    if (player != null && dist(player.position.x, player.position.y, position.x, position.y) <= sight/2)
    {
      //Updates...Read TODO
      /****************************/
      cooldown--;
      inSight = true;
      pushMatrix();
      translate(position.x, position.y);
      angtemp = atan2(player.position.y - position.y, player.position.x - position.x);
      popMatrix();
      ang1 = angtemp - floatLimit(map(cooldown, maxCoolDown, 0, 0.7, 0.1), 0.1);
      ang2 = angtemp + floatLimit(map(cooldown, maxCoolDown, 0, 0.7, 0.1), 0.1);
      /****************************/
      
      //Apply a velocity towards the player
      if (player.position.x > position.x)
      {
        velocity.x = lerp(velocity.x, speed, 0.1);
      } else if (player.position.x < position.x)
      {
        velocity.x = lerp(velocity.x, -speed, 0.1);
      } else 
      {
        velocity.x = lerp(velocity.x, 0, 0.1);
      }

      if (player.position.y > position.y)
      {
        velocity.y = lerp(velocity.y, speed, 0.1);
      } else if (player.position.y < position.y)
      {
        velocity.y = lerp(velocity.y, -speed, 0.1);
      } else 
      {
        velocity.y = lerp(velocity.y, 0, 0.1);
      }
      
      //Add to update...
      if (cooldown < -maxCoolDown/2)
      {
        //SHOOT BULLET
        cooldown = maxCoolDown;
      }
    } else
    {
      //If player is not close enough, kinda random movement
      //TODO: Clean random movement
      cooldown = maxCoolDown;
      inSight = false;
      velocity.x += random(-0.1, 0.1);
      velocity.y += random(-0.1, 0.1);
    }
    velocity.limit(speed);
  }


  void show()
  {
    if (inSight)  //If the player is close, do the "scope-effect"
    {
      fill(250, 10);
      arc(position.x, position.y, sight, sight, ang1, ang2);
      if (cooldown < 0)
      {
        fill(200, 0, 0, 50);
        arc(position.x, position.y, map(cooldown, 0, -maxCoolDown/2, 0, sight), map(cooldown, 0, -maxCoolDown/2, 0, sight), ang1, ang2);
      }
    }
    
    //How the enemy looks
    fill(filler);
    rect(position.x, position.y, dimentions.x, dimentions.y);
  }
}