class Entity
{
  PVector position;
  String collider;
  PVector velocity;
  PVector dimentions;
  color filler;

  Entity()
  {
    position = new PVector(width/2, height/2);
    collider = "NONE";
    velocity = new PVector(random(-3, 3), random(-3, 3));
    filler = color(random(255), random(255), random(255));
    dimentions = new PVector(50, 50);
  }

  void update()
  {
    position.add(velocity);
  }

  void show()
  {
    fill(filler);
    rect(position.x, position.y, dimentions.x, dimentions.y);
  }
}