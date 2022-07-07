void cambiarAInicio(){
  estado = 0;
}

void cambiarAInstrucciones() {
  estado = 1;
}

void cambiarACreditos() {
  estado = 2;
}

void cambiarAPersonaje(){
 estado = 3;
}

void cambiarAJuego() {
  //asigna todos los valores iniciales del estado jugando:
  estado = 4;
  
  gatoX = 300; 
  gatoY = 545;
  velGato = 0;
   
  velObjetos = 6;
  
  for (int i=0; i < cant; i++) {
    aguaX[i] = random(50, 550);
    lanaX[i] = random(50, 550);
    lanaY[i] = random(-2000, 0);
    aguaY[i] = random(-2050, 0);
  }
  
}
void cambiarAGanar(){
 estado = 5; 
}

void cambiarAPerder(){
 estado = 6; 
}
