class Gato {
  float x, y;
  PImage gatoImg;
  float vel;
  
  Gato(float x, float y) {
    imageMode(CENTER);
    this.x = x;
    this.y = y;
    
    gatoImg = loadImage("gato.png");
    vel = 0;
  }
  
  void dibujar() {
    image(gatoImg, x, y);
  }
  
  void mover() {
    x += vel;
    
    if (keyPressed == true) {
      if (keyCode == RIGHT) {
        vel = 4;
      } else if (keyCode == LEFT) {
        vel = -4;
      }
    } else {
      vel = 0;
    }
  }
}
