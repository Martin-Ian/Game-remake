class Mother extends Enemy
{
  int maxChildren = 5;
  ArrayList<Enemy> children = new ArrayList<Enemy>();

  Mother()
  {
    super();
  }

  Mother(float posX, float posY)
  {
    super(posX, posY); 
    filler = color(255, 133, 3);
    type = "Enemy";
    canShoot = false;
    maxCoolDown = 50;
    cooldown = maxCoolDown;
  }

  void update()
  {
    if (moveable)
      position.add(velocity);
    if (player.alive && children.size() < maxChildren)
    {
      cooldown--;
      if (cooldown < -maxCoolDown/2)
      {
        cooldown = maxCoolDown;
        Enemy E = new Enemy(position.x, position.y, this);
        enemies.add(E);
        children.add(E);
      }
    } else 
    {
      cooldown = maxCoolDown;
    }
  }
}