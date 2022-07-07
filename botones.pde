// FUNCIONES PARA DIBUJAR BOTONES

void botonRectangular(float posX, float posY, float botonX, float botonY, String texto) {
  // dibuja un boton rectangular
  fill(255);
  noStroke();
  rect(posX, posY, botonX, botonY, 15);
  fill(0);
  text(texto, posX, posY - 5);
}

void botonAtras() {
  // dibuja un boton circular para volver atrás
  fill(0);
  ellipse(45, 45, 50, 50);
  fill(255);
  triangle(25, 45, 55, 30, 55, 60);
}

void botonCircular(float posX, float posY, float botonX, float botonY) {
  noStroke();
  ellipse(posX, posY, botonX, botonY);
}
