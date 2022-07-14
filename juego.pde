// GATO: posicion y velocidad inicial
int gatoX = 300, gatoY = 545;  
float velGato = 0; 
PImage gatito;

// OBJETOS: velocidad y ubicacion
float velObjetos = 6;

// arreglos para ubicación
float [] aguaX = new float [cant];
float [] aguaY = new float [cant];
float [] lanaX = new float [cant];
float [] lanaY = new float [cant];

// PUNTAJE
int puntaje = 0;

void juego() {
  // dibuja la pantalla del juego
  push();
  background(247, 181, 95);
  fill(0);
  textSize(20);
  text("Puntaje:" + puntaje, 60, 25);
  
  image(gatito, gatoX, gatoY);  
  gatoX += velGato; // velocidad del gato
  
  // ubicación y velocidad de los objetos que caen
  for (int i=0; i < cant; i++) {
    image(lana[i], lanaX[i], lanaY[i]);
    image(agua[i], aguaX[i], aguaY[i]);
    lanaY[i] += velObjetos;
    aguaY[i] += velObjetos;
    
    // GANAR O PERDER
    if (colisionDosSupCirculares(gatoX, gatoY, 55, lanaX[i], lanaY[i], 50)) {
     lanaX[i] = -200;
     lanaY[i] = -100;
     puntaje++;
    } else if (colisionDosSupCirculares(gatoX, gatoY, 55, aguaX[i], aguaY[i], 50)) {
      cambiarAPerder();
    } else if (aguaY[0] > height && aguaY[1] > height && aguaY[2] > height && aguaY[3] > height && 
               aguaY[4] > height && aguaY[5] > height && aguaY[6] > height && aguaY[7] > height && 
               aguaY[8] > height && aguaY[9] > height) {
      cambiarAGanar();
    }
  }
  pop();
}

// MOVIMIENTO HORIZONTAL DEL GATO
void keyPressed() {
  if (keyCode == RIGHT) {       
    velGato = 7;                  
  } else if (keyCode == LEFT) { 
    velGato = -7;         
  }
}

void keyReleased() {          
  velGato = 0;      
}
