class Enemy2 extends GameObject {

  int threshold;
  int cooldown;
  Enemy2() {
    super(random(0, 20), random(0, 150), random(0, 5), 3, 20, yellow, 1);
    threshold=80;
    cooldown=threshold;
  }

  void act() {
    super.act();
    //shoot
    cooldown++;
    if (cooldown>=threshold) {
      objects.add(new EnemyBullet(x, y, random(6, 9), random(8, 10)));
      cooldown=0;
    }



    //collision
    int i=0;
    while (i<objects.size()) {
      GameObject obj=objects.get(i);
      if (obj instanceof Bullet) {
        if (collidingWith(obj)) {
          lives--;
          if (lives==0) {
            objects.add(new EnemyEffect(x, y, 0, 5, c));
            objects.add(new EnemyEffect(x, y, 5, 0, c));
            objects.add(new EnemyEffect(x, y, 0, -5, c));
            objects.add(new EnemyEffect(x, y, -5, 10, c));
            objects.add(new EnemyEffect(x, y, 0, 10, c));
            objects.add(new EnemyEffect(x, y, 10, 0, c));
            objects.add(new EnemyEffect(x, y, 0, -10, c));
            objects.add(new EnemyEffect(x, y, -10, 10, c));
            objects.add(new EnemyEffect(x, y, -10, -10, c));
            objects.add(new EnemyEffect(x, y, -5, 5, c));
            objects.add(new EnemyEffect(x, y, -10, -5, c));
            objects.add(new EnemyEffect(x, y, -5, 10, c));
          }
        }
      }
      i++;
    }

    //remove if goes off screen
    if (offScreen())lives=0;
  }


  
  
}
