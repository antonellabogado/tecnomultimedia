// TP#3: Juego interactivo libre
// Antonella Bogado Benuzzi 81745/3
// Comisión 3 
// https://youtu.be/g-xNNycdKLc

// variable de estado: 
int estado=0; 

PImage fondoInicio; 
PFont fuente;

int cant = 10; // cantidad de elementos dentro de los arreglos agua y lana

// arreglos de imagenes
PImage [] gato = new PImage [3];
PImage [] agua = new PImage [cant];
PImage [] lana = new PImage [cant];

void setup() {
  size(600, 600);
  
  // carga de fuente
  fuente = createFont("font.ttf", 80);
  textFont(fuente);
  
  // modo en el que se dibujan los elementos
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);
  
  // carga de imágenes
  fondoInicio =  loadImage ("fondoInicio.png");
  
  for (int g=0; g < gato.length; g++){
    gato[g] = loadImage("gato_" + g + ".png");
  }
  
  for (int i=0; i < cant; i++) {
    agua[i] = loadImage("agua.png");
    lana[i] = loadImage("lana.png");
  }
  
  // posición inicial de los objetos que caen
  for (int i=0; i < cant; i++) {
    aguaX[i] = random(50, 550);
    lanaX[i] = random(50, 550);
    lanaY[i] = random(-2000, 0);
    aguaY[i] = random(-2050, 0);
  }
}

void draw() {
  // lógica de estados
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
  // en inicio 
  if (estado == 0) {
     if (colisionCoorSupRectangular(width/2, height/2 + 25, 130, 50, mouseX, mouseY)) {   // BOTON JUGAR
      cambiarAPersonaje();
    } else if (colisionCoorSupRectangular((width/2)/2, height/2 + 100, 130, 50, mouseX, mouseY)) {  // BOTON INSTRUCCIONES
      cambiarAInstrucciones();
    } else if (colisionCoorSupRectangular((width/2)/2 + width/2, height/2 + 100, 130, 50, mouseX, mouseY)) { // BOTON CRÉDITOS
      cambiarACreditos();
    }
  } // en instrucciones o créditos
    else if (estado == 1 || estado == 2) {
      if (colisionCoordenadaConSupCircular(45, 45, 25, mouseX, mouseY)) {   // BOTON VOLVER A INICIO
        cambiarAInicio();
      }
    } // en elige a tu personaje
    else if (estado == 3) { // BOTON SELECCIONAR PERSONAJE > JUEGO
      if (colisionCoordenadaConSupCircular((width/2)/2, height/3 + 200, 90, mouseX, mouseY)) {
        gatito = gato[1];
      } else if (colisionCoordenadaConSupCircular((width/2)/2 + width/2, height/3 + 200, 90, mouseX, mouseY)) {
        gatito = gato[2];
      } else if (colisionCoordenadaConSupCircular(width/2, height/3, 90, mouseX, mouseY)) {
        gatito = gato[0];
      }
      cambiarAJuego();
    } // en ganar o perder 
    else if (estado == 5 || estado == 6) { 
      if (colisionCoorSupRectangular((width/2)/2, height/2 + 100, 130, 50, mouseX, mouseY)) {  // BOTON VOLVER A JUGAR 
        cambiarAPersonaje();
      } else if (colisionCoorSupRectangular((width/2)/2 + width/2, height/2 + 100, 130, 50, mouseX, mouseY)) {  // BOTON IR A INICIO
        cambiarAInicio();
      }
   }
} 
