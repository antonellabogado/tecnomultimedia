// TP#3: Juego interactivo libre
// Antonella Bogado Benuzzi 81745/3
// Comisión 3 
// LINK YOUTUBE

// variable de estado: 
int estado=0; 
/* 0 inicio
   1 instrucciones
   2 creditos 
   3 elige a tu personaje
   4 juego
   5 ganar
   6 perder
   */
   
PFont fuente;
int cant = 10;
PImage [] gato = new PImage [3];
PImage [] agua = new PImage [cant];
PImage [] lana = new PImage [cant];

void setup() {
  size(600, 600);
  
  fuente = createFont("font.ttf", 80);
  textFont(fuente);
  
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);
  
  for (int i=0; i < cant; i++) {
    aguaX[i] = random(50, 550);
    lanaX[i] = random(50, 550);
    lanaY[i] = random(-2000, 0);
    aguaY[i] = random(-2050, 0);
  }
  
}

void draw() {
  if (estado == 0) {
    inicio();
  } else if (estado == 1) {
    instrucciones();
  } else if (estado == 2) {
    creditos();
  } else if (estado == 3) {
    eligeATuPersonaje();
  } else if (estado == 4) {
    juego();
  } else if (estado == 5) {
    ganar();
  } else if (estado == 6) {
    perder();
  }
}

void mousePressed() {  
  if (estado == 0) {
    // BOTON JUGAR
     if (colisionCoorSupRectangular(width/2, height/2 + 25, 130, 50, mouseX, mouseY)) {
      cambiarAPersonaje();
    }
    // BOTON INSTRUCCIONES
    if (colisionCoorSupRectangular((width/2)/2, height/2 + 100, 130, 50, mouseX, mouseY)) {
      cambiarAInstrucciones();
    }
    // BOTON CRÉDITOS
    if (colisionCoorSupRectangular((width/2)/2 + width/2, height/2 + 100, 130, 50, mouseX, mouseY)) {
      cambiarACreditos();
    }
  }
  // BOTON VOLVER DE CRÉDITOS/INSTRUCCIONES A INICIO
  else if (estado == 1 || estado == 2) {
    if (colisionCoordenadaConSupCircular(45, 45, 25, mouseX, mouseY)) {
      cambiarAInicio();
    }
  } 
  // BOTON SELECCION PERSONAJE > JUEGO
  else if (estado == 3) {
    if (colisionCoordenadaConSupCircular((width/2)/2, height/3 + 200, 90, mouseX, mouseY)) {
      gatito = gato[1];
    } else if (colisionCoordenadaConSupCircular((width/2)/2 + width/2, height/3 + 200, 90, mouseX, mouseY)) {
      gatito = gato[2];
    } else if (colisionCoordenadaConSupCircular(width/2, height/3, 90, mouseX, mouseY)) {
      gatito = gato[0];
    }
    cambiarAJuego();
  } 
  else if (estado == 5 || estado == 6) { 
    // BOTON VOLVER A JUGAR 
    if (colisionCoorSupRectangular((width/2)/2, height/2 + 100, 130, 50, mouseX, mouseY)) {
      cambiarAPersonaje();
    }
    // BOTON IR A INICIO
    else if (colisionCoorSupRectangular((width/2)/2 + width/2, height/2 + 100, 130, 50, mouseX, mouseY)) {
      cambiarAInicio();
    }
  }
} 
