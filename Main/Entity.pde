class Entity
{
  PVector position;
  String collider;
  PVector velocity;
  PVector dimentions;
  color filler;
  boolean moveable;
  float ID = random(1);

  Entity()
  {
    position = new PVector(width/2, height/2);
    collider = "NONE";
    velocity = new PVector(random(-3, 3), random(-3, 3));
    filler = color(random(255), random(255), random(255));
    dimentions = new PVector(50, 50);
    moveable = true;
  }

  Entity(float posX, float posY)
  {
    position = new PVector(posX, posY);
    collider = "NONE";
    velocity = new PVector(random(-3, 3), random(-3, 3));
    filler = color(random(255), random(255), random(255));
    dimentions = new PVector(50, 50);
    moveable = true;
  }

  Entity(float posX, float posY, float dimX, float dimY)
  {
    position = new PVector(posX, posY);
    collider = "NONE";
    velocity = new PVector(random(-3, 3), random(-3, 3));
    filler = color(random(255), random(255), random(255));
    dimentions = new PVector(dimX, dimY);
    moveable = true;
  }

  Entity(float posX, float posY, float dimX, float dimY, float velX, float velY)
  {
    position = new PVector(posX, posY);
    collider = "NONE";
    velocity = new PVector(velX, velY);
    filler = color(random(255), random(255), random(255));
    dimentions = new PVector(dimX, dimY);
    moveable = true;
  }

  boolean collides(Entity E)
  {
    if (this.ID != E.ID)
    {
      if (this.position.x + this.dimentions.x/2 > E.position.x - E.dimentions.x/2)
      {
        if (this.position.x - this.dimentions.x/2 < E.position.x + E.dimentions.x/2)
        {
          if (this.position.y + this.dimentions.y/2 > E.position.y - E.dimentions.y/2)
          {
            if (this.position.y + this.dimentions.y/2 < E.position.y - E.dimentions.y/2)
            {
              return true;
            }
          }
        }
      }
    }
    return false;
  }

  void update()
  {
    if (moveable)
      position.add(velocity);
  }

  void show()
  {
    fill(filler);
    rect(position.x, position.y, dimentions.x, dimentions.y);
  }
}