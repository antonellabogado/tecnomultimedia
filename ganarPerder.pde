void ganar() {
  // dibuja la pantalla cuando gana
  push();
  background(247, 181, 95);
  image(gatito, gatoX, gatoY);  
  fill(255);
  textSize(72);
  text("¡Ganaste!", width/2, 200);
  textSize(40);
  text("Puntaje:" + puntaje, width/2, 250);
  
  textSize(16);
  botonRectangular((width/2)/2, height/2 + 100 , 130, 50, "Volver a jugar");
  botonRectangular((width/2)/2 + width/2, height/2 + 100 , 130, 50, "Inicio"); 
  pop();
}

void perder() {
  // dibuja la pantalla cuando pierde
  push();
  background(247, 181, 95);
  
  image(gatito, gatoX, gatoY);  
  
  fill(255);
  textSize(72);
  text("Perdiste :(", width/2, height/3);
  
  textSize(16);
  botonRectangular((width/2)/2, height/2 + 100 , 130, 50, "Volver a jugar");
  botonRectangular((width/2)/2 + width/2, height/2 + 100 , 130, 50, "Inicio"); 
  pop();
}
