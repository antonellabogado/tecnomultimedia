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
  
  // CARGA DE IMAGENES
  for (int i=0; i < cant; i++) {
    agua[i] = loadImage("agua.png");
    lana[i] = loadImage("lana.png");
  }
 
  push();
  background(247, 181, 95);
  fill(0);
  textSize(20);
  text("Puntaje:" + puntaje, 60, 25);
  
  image(gatito, gatoX, gatoY);  
  
  for (int i=0; i < cant; i++) {
    image(lana[i], lanaX[i], lanaY[i]);
    image(agua[i], aguaX[i], aguaY[i]);
  }
  
  for (int v=0; v < cant; v++) {
    lanaY[v] += velObjetos;
    aguaY[v] += velObjetos;
  }
  
  gatoX += velGato; // velocidad del gato
  
  // COLISIONES
  for (int i=0; i < cant; i++) {
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
    velGato = 9;                  
  } else if (keyCode == LEFT) { 
    velGato = -9;         
  }
}

void keyReleased() {          
  velGato = 0;      
}
