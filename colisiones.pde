// FUNCIONES PARA EVALUAR COLISIONES:

boolean colisionCoordenadaConSupCircular(float x1, float y1, float r, float x2, float y2) {
  //evalua si hay colision de x1,y1 en el circulo x,y con radio r:
  float distancia = dist( x1, y1, x2, y2);
  //como resultado, devolvemos true/false si distancia es menor que r_:
  return distancia<=r;
}

boolean colisionDosSupCirculares(float x1, float y1, float r1, float x2, float y2, float r2) {
  //evalua si hay colision entre dos circulos con centros x1, y1, x2, y2 y radios r1, r2
  float distancia = dist( x1, y1, x2, y2);
  //como resultado, devolvemos true/false si distancia es menor que r:
  return distancia<=(r1+r2);
}

boolean colisionCoorSupRectangular(float x1, float y1, float ancho, float alto, float x2, float y2) {
  if ( x2>x1-(ancho/2) && x2<x1+(ancho/2) && y2>y1-(alto/2) && y2<y1+(alto/2) ) {
    return true;
  }
  return false;
}
