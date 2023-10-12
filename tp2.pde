import fisica.*;
import processing.sound.*;
import processing.video.*;
import gab.opencv.*;

// Cámara
Capture camara;
int anchoCam = 240;
int altoCam = (anchoCam * 9) / 16;

// OpenCV
OpenCV opencv;
ArrayList <Contour> contornos;
boolean invertir = false;

// Sonido
SoundFile sonido, salto, crash, comenzar, ganar, perder, timer;

Principal principal;

int score = 0;

// Puntero
float punteroX, punteroY;
float posX = 0;
float posY = 0;
float lerpFactor = 0.05; // Factor de interpolación (ajusta la suavidad del movimiento)

void setup() {
  size(1280, 720);

  camara = new Capture(this, anchoCam, altoCam);
  camara.start();

  opencv = new OpenCV(this, anchoCam, altoCam);

  // Sonidos
  sonido = new SoundFile(this, "breakstuff.mp3");  
  salto = new SoundFile(this, "salto.wav");
  crash = new SoundFile(this, "crash.wav");
  comenzar = new SoundFile(this, "comenzar.wav");
  ganar = new SoundFile(this, "ganar.wav");
  perder = new SoundFile(this, "perder.wav");
  timer = new SoundFile(this, "beep.mp3");
  
  sonido.play();

  Fisica.init(this);

  principal = new Principal();
}

void draw() {
  principal.display();
  principal.cambiarDeEstado();

  int umbral = 213;

  noFill();

  // Cámara y detección de blobs
  if (camara.available()) {
    camara.read();
    opencv.loadImage(camara);
    if (invertir) opencv.invert(); // invertir colores
    opencv.threshold(umbral); // aplicar umbral
    contornos = opencv.findContours();
  }

  PImage salida = opencv.getOutput();

  pushMatrix();
  translate(0, 0);
  scale(-1, 1); // Espeja la cámara
  image(salida, 0, 0);
  stroke(0, 255, 0);

  if (!contornos.isEmpty()) {
    Contour blob = contornos.get(0); // Dibuja solo el primer blob

    // transforma el contorno en uno más simple
    Contour contornoAproximado = blob.getPolygonApproximation();
    // obtengo los puntos del nuevo contorno
    ArrayList<PVector> puntos = contornoAproximado.getPoints();

    // Calcula las dimensiones del blob
    float minX = Float.MAX_VALUE;
    float minY = Float.MAX_VALUE;
    float maxX = Float.MIN_VALUE;
    float maxY = Float.MIN_VALUE;

    for (PVector punto : puntos) {
      if (punto.x < minX) minX = punto.x;
      if (punto.x > maxX) maxX = punto.x;
      if (punto.y < minY) minY = punto.y;
      if (punto.y > maxY) maxY = punto.y;
    }

    // Calcula el centro y dimensiones de la elipse
    float ellipseX = (minX + maxX) / 2;
    float ellipseY = (minY + maxY) / 2;
    float ellipseAncho = maxX - minX;
    float ellipseAlto = maxY - minY;

    // Interpola las coordenadas de la ellipse actual a las nuevas
    posX = lerp(posX, ellipseX, lerpFactor);
    posY = lerp(posY, ellipseY, lerpFactor);

    // Dibuja la elipse por encima del blob
    ellipse(posX, posY, ellipseAncho, ellipseAlto);
    
    // Calcula la posición correspondiente en la pantalla del juego
    punteroX = map(posX - anchoCam, 0, anchoCam, 0, width);
    punteroY = map(posY, 0, altoCam, 0, height);

    fill(20, 255, 60, 120);
    ellipse(punteroX, punteroY, 15, 15);
  }  
  popMatrix();
}
