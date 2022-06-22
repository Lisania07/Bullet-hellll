class Bullet extends GameObject {

  //constructor
  Bullet() {
    super(player1.x,player1.y,0,-10,8,#FF0000,1);
  }
  void act() {
    super.act();
    if (offScreen()) lives=0;
  }
}
