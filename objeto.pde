class Objeto {
  float x, y, xInicial, yInicial;
  String nombre;
  PImage img;
  float vel;
  
  Objeto(float x, float y, String nombre) {
    this.x = x;
    this.y = y;
    this.nombre = nombre;
    
    img = loadImage(nombre+".png");
    vel = 2;
  }
  
  void dibujar() {
    image(img, x, y);
  }
  
  void mover() {
    y += vel;
  }
  
  void reiniciar() {
    
  }
  
  boolean colisionDosSupCirculares(float x1, float y1, float r1, float x2, float y2, float r2) {
    //evalua si hay colision entre dos circulos con centros x1, y1, x2, y2 y radios r1, r2
    float distancia = dist( x1, y1, x2, y2);
    //como resultado, devolvemos true/false si distancia es menor que r:
    return distancia<=(r1+r2);
  }
}
