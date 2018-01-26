/*********************************
Bullet.pde
This is the bullet class, when the 
player gets hit by 3 bullets, they die
*********************************/

class Bullet extends Entity
{
 
  Bullet()
  {
     super(); 
  }
  
  Bullet(float posX, float posY, float ang)
  {
    super(posX, posY);
    type = "Bullet";
    velocity = PVector.fromAngle(ang);
    velocity.mult(7);
    filler = color(255, 0, 255);
    dimentions = new PVector(10, 10);
  }
  
}