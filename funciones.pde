void dibujarCirculos() {
  noStroke();
  fill(255, 64, 68);
  ellipse(posX, height/2, 100, 100);
  ellipse(500, height/2, 100, 100);
}

void dibujarBoton() {
  fill(255);
  ellipse(560, 560, 40, 40);
  fill(texto);
  textSize(30);
  text("R", 550, 570);
}
