void inicio() {
  // dibuja la pantalla de inicio
  background(fondoInicio);
  push();
  
  fill(0);
  text("KITTENS GAME", width/2, height/3);

  textSize(32);
  botonRectangular(width/2, height/2 + 25, 130, 50, "JUGAR");
  textSize(16);
  botonRectangular((width/2)/2, height/2 + 100 , 130, 50, "Instrucciones");
  botonRectangular((width/2)/2 + width/2, height/2 + 100 , 130, 50, "Créditos");  
  pop();  
}

void instrucciones() {
  // dibuja la pantalla de instrucciones
  push();
  background(fondoInicio);
  textSize(24);
  text("INSTRUCCIONES", width/2, height/3);
  text("El objetivo es que el gatito atrape \n la mayor cantidad de bolas de lana, \n pero ¡OJO! si lo mojas con agua perdes. \n ¡Mueve al gatito con las flechas!", width/2, height/2);
  botonAtras(); 
  pop();
}

void creditos() {
  // dibuja la pantalla de creditos
  push();
  background(fondoInicio);  
  textSize(24);
  text("CRÉDITOS", width/2, height/3);  
  text("Desarrollado por Antonella Bogado Benuzzi \n Comisión 3 de Tecnología Multimedial 1 \n Diseño Multimedial UNLP", width/2, height/2);
  botonAtras();
  pop();
}
