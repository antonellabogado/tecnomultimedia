class Boton {
  float x, y, tamX, tamY;
  String texto;
  
  Boton(float x, float y, float tamX, float tamY, String texto) {
    this.x = x;
    this.y = y;
    this.tamX = tamX;
    this.tamY = tamY;
    this.texto = texto;
    
    noStroke();
  }
  
  void dibujarBotonRect() {
    fill(255);
    rect(x, y, tamX, tamY, 15);
    fill(0);
    text(texto, x, y - 5);
  }
  
  void dibujarBotonCirc() {
    fill(0);
    ellipse(x, y, tamX, tamY);
    fill(255);
    triangle(25, 45, 55, 30, 55, 60);
  }
  
  boolean colisionCoorSupRectangular(float x1, float y1, float ancho, float alto, float x2, float y2) {
    if ( x2>x1-(ancho/2) && x2<x1+(ancho/2) && y2>y1-(alto/2) && y2<y1+(alto/2) ) {
      return true;
    }
    return false;
  }
  
  boolean colisionCoordenadaConSupCircular(float x1, float y1, float r, float x2, float y2) {
    //evalua si hay colision de x1,y1 en el circulo x2,y2 con radio r:
    float distancia = dist( x1, y1, x2, y2);
    //como resultado, devolvemos true/false si distancia es menor que r:
    return distancia<=r;
  }
}
